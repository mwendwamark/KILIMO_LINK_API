class Farm < ApplicationRecord
  belongs_to :user
  enum farm_type: { dairy: "dairy", horticulture: "horticulture", poultry: "poultry", aquaculture: "aquaculture", agroforestry: "agroforestry" }
end
