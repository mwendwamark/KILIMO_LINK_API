# app/models/farm.rb
class Farm < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy

  # Valid farm types
  FARM_TYPES = %w[dairy horticulture poultry aquaculture agroforestry].freeze

  # Validations
  validates :farm_name, presence: true
  validates :county, presence: true
  validates :farm_type, presence: true, inclusion: {
                in: FARM_TYPES,
                message: "%{value} is not a valid farm type",
              }

  # Optional: Add helper methods if you need them
  def dairy?
    farm_type == "dairy"
  end

  def horticulture?
    farm_type == "horticulture"
  end

  def poultry?
    farm_type == "poultry"
  end

  def aquaculture?
    farm_type == "aquaculture"
  end

  def agroforestry?
    farm_type == "agroforestry"
  end
end
