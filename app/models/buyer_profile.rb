class BuyerProfile < ApplicationRecord
  belongs_to :user

  private

  def user_must_be_buyer
    errors.add(:user, "must have buyer role") unless user.buyer?
  end
end
