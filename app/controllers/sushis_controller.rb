class SushisController < ApplicationController

    def index
        @sushis = Sushi.all
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

    end

    def create
        byebug
    end
end
