class SushisController < ApplicationController
    layout "custom"

    def index
        
        @sushis = Sushi.all
        render :layout => "application"
    end

    def show
        @sushi = Sushi.find_by(id:params[:id])
        if @sushi
            render "show"
        else
            redirect_to sushis_path
        end
    end

    def new
        @sushi = Sushi.new 
        5.times { @sushi.ingredients.build }
    end

    def create
        @sushi = Sushi.new(sushi_params)
        if @sushi.save
            redirect_to @sushi
        else
            # byebug
            render "new"
        end
        
    end

    def edit
        @sushi = Sushi.find_by(id:params[:id])
        if @sushi
            render "edit"
        else
            redirect_to sushis_path
        end
    end

    def update
        @sushi = Sushi.find_by(id:params[:id])
        if @sushi
            # update the sushi and then render show page
            @sushi.update(sushi_params)
            if @sushi.errors.any?
                render "edit"
            else
                redirect_to @sushi
            end
        else
            render "edit"
        end
    end

    def destroy
        @sushi = Sushi.find_by(id:params[:id])
        @sushi.destroy
        redirect_to sushis_path
    end

    private
    def sushi_params
        params.require(:sushi).permit(:name, ingredients_attributes:[:id,:name, :calories, :ss_grams])
    end

end
