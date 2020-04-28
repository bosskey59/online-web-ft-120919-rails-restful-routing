class IngredientsController < ApplicationController

    def index 
        if params[:sushi_id]
            @sushi = Sushi.find_by_id(params[:sushi_id])
            @ingredients = @sushi.ingredients
        else
            @ingredients = Ingredient.all
        end
    end

    def show
        @ingredient = Ingredient.find_by_id(params[:id])
        if params[:sushi_id]
            @sushi = Sushi.find_by_id(params[:sushi_id])
        end
    end

    def new
        if params[:sushi_id]
            set_sushi
            @ingredient = @sushi.ingredients.build
        else
            @ingredient = Ingredient.new
        end
    end

    def create
        if params[:sushi_id]
            set_sushi
            @ingredient = @sushi.ingredients.build(ingr_params)
        else
            @ingredient = Ingredient.new(ingr_params)
        end
        if @ingredient.save
            redirect_to @ingredient
        else
            render :new, alert: "Error creating Ingredient!"
        end
    end

    private

    def ingr_params
        params.require(:ingredient).permit(:name, :ss_grams, :calories)
    end
    def set_sushi
        @sushi = Sushi.find_by_id(params[:sushi_id])
    end
end