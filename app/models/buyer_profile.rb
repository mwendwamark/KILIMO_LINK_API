class BuyerProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture

  private

  def user_must_be_buyer
    errors.add(:user, "must have buyer role") unless user.buyer?
  end
end
