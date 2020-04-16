class CustomController < ApplicationController

    def greeting
        @greeting = "Hello, #{params[:name]}"
    end 

    # Input Box to get Query(form)
    # get request
    def search

    end

    # Search for what matches the Query
    # recive query & display matches
    # get
    def resolved
        @sushis = Sushi.all.find_all{|s| s.name.downcase.include?(params[:query].downcase)}
        render "sushis/index"
    end

    # 

end
