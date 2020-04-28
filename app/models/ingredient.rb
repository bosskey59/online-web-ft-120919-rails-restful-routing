class Ingredient < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :sushi
end
