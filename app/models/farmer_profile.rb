class FarmerProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture
  validate :user_must_be_farmer

  private

  def user_must_be_farmer
    errors.add(:user, "must have farmer role") unless user.farmer?
  end
end
