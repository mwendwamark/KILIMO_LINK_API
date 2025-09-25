class FarmerProfile < ApplicationRecord
  belongs_to :user
  validate :user_must_be_farmer

  private

  def user_must_be_farmer
    errors.add(:user, "must have farmer role") unless user.farmer?
  end
end
