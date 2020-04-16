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
        @sushi = Sushi.new

    end

    def create
        @sushi = Sushi.new(sushi_params)
        if @sushi.save
            redirect_to @sushi
        else
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
        params.require(:sushi).permit(:name)
    end

end
