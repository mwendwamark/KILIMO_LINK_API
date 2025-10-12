# app/models/product.rb
class Product < ApplicationRecord
  # Relationships
  belongs_to :farm
  has_many :reviews, dependent: :destroy

  # Valid categories and units (using constants instead of enums)
  CATEGORIES = %w[livestock crops fruits vegetables dairy poultry aquaculture].freeze
  UNITS = %w[kg g ton liter piece animal acre bunch dozen].freeze

  # Validations
  validates :product_name, presence: true
  validates :category, presence: true, inclusion: {
               in: CATEGORIES,
               message: "%{value} is not a valid category",
             }
  validates :unit, inclusion: {
           in: UNITS,
           message: "%{value} is not a valid unit",
         }, allow_nil: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price_per_unit, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :age, presence: true, if: :animal_category?
  validates :harvest_date, presence: true, if: :crop_category?

  # Helper methods for categories
  def livestock?
    category == "livestock"
  end

  def crops?
    category == "crops"
  end

  def fruits?
    category == "fruits"
  end

  def vegetables?
    category == "vegetables"
  end

  def dairy?
    category == "dairy"
  end

  def poultry?
    category == "poultry"
  end

  def aquaculture?
    category == "aquaculture"
  end

  private

  def animal_category?
    %w[livestock poultry aquaculture].include?(category)
  end

  def crop_category?
    %w[crops fruits vegetables].include?(category)
  end
end
