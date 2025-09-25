# app/models/user.rb
class User < ApplicationRecord
  # Devise modules for authentication
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

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
  validates :phone_number, format: { with: /\A\+254\d{9}\z/ }, allow_blank: true

  # Helper methods for roles (since roles is an array)
  def buyer?
    roles.include?("buyer")
  end

  def farmer?
    roles.include?("farmer")
  end
end
