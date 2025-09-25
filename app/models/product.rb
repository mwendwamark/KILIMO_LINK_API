# app/models/product.rb
class Product < ApplicationRecord
  # Relationships
  belongs_to :farm
  # has_many :product_media, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Enums
  enum category: { livestock: "livestock", crops: "crops", fruits: "fruits", vegetables: "vegetables", dairy: "dairy", poultry: "poultry", aquaculture: "aquaculture" }
  enum unit: { kg: "kg", g: "g", ton: "ton", liter: "liter", piece: "piece", animal: "animal", acre: "acre", bunch: "bunch", dozen: "dozen" }

  # Validations
  validates :product_name, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price_per_unit, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :age, presence: true, if: :animal_category?
  validates :harvest_date, presence: true, if: :crop_category?

  private

  def animal_category?
    %w[livestock poultry aquaculture].include?(category)
  end

  def crop_category?
    %w[crops fruits vegetables].include?(category)
  end
end
