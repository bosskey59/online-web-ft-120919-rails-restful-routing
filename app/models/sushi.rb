class Sushi < ApplicationRecord
    validates :name, uniqueness: true
end
