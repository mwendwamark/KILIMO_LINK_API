# app/models/user.rb
class User < ApplicationRecord
  # Devise modules for authentication
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: Devise::JWT::RevocationStrategies::JTIMatcher

  # Relationships
  has_one :buyer_profile, dependent: :destroy
  has_one :farmer_profile, dependent: :destroy
  has_many :farms, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :conversation_participants, dependent: :destroy
  has_many :conversations, through: :conversation_participants

  # Validations
  validates :phone_number, format: { with: /\A\+254\d{9}\z/ }, allow_blank: true, uniqueness: { allow_nil: true }
  validate :single_valid_role

  # Virtual login attribute to accept email or phone_number
  attr_writer :login

  def login
    @login || email || phone_number
  end

  # Helper methods for roles (since roles is an array)
  def buyer?
    Array(roles).include?("buyer")
  end

  def farmer?
    Array(roles).include?("farmer")
  end

  # Devise-jwt: JTI handled by JTIMatcher; ensure jti present
  before_create :generate_jti

  # Allow login by email or phone_number
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where([
        'lower(email) = :value OR phone_number = :raw',
        { value: login.downcase, raw: login }
      ]).first
    else
      where(conditions.to_h).first
    end
  end

  private

  def generate_jti
    self.jti = SecureRandom.uuid
  end

  # Include id and roles in JWT payload for client-side role checks
  def jwt_payload
    super.merge('id' => id, 'roles' => Array(roles))
  end

  def single_valid_role
    allowed = %w[buyer farmer]
    current_roles = Array(roles).reject(&:blank?)
    if current_roles.size != 1
      errors.add(:roles, 'must contain exactly one role')
    elsif !allowed.include?(current_roles.first)
      errors.add(:roles, 'is invalid')
    end
  end
end
