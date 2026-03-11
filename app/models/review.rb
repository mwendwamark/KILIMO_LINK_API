class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, inclusion: { in: 1..5 }, presence: true
  validates :user_id, uniqueness: {
    scope: :product_id,
    message: "You have already reviewed this product"
  }
end
