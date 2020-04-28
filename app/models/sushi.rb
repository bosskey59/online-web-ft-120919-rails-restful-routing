class Sushi < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    validate :starts_with_a
    has_many :ingredients
    accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['ss_grams'].blank? || attributes['name'].blank?} 

    # def ingredients_attributes=(ing_attr)
    #     ing_attr.values.each do |ing_attrs|
    #         # verift that all fields are filled
    #         if ing_attrs["name"] != "" && ing_attrs["calories"] != "" && ing_attrs["ss_grams"] != ""
    #             # if they are create a ingr with assosiation to Sushi
    #             # ing = Ingredient.new(ing_attrs)
    #             # ing.sushi_id = self.id
    #             self.ingredients.build(ing_attrs)
    #         end
    #     end
    # end

    def created
        self.created_at.strftime("%m-%e-%y %H:%M")
    end

    private
    def starts_with_a
        if name[0].downcase == "a"
            errors.add(:a, "cannot be the first letter")
        end 
    end

end
