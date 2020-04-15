Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #index
  get '/sushis', to: "sushis#index"
  # new
  get '/sushis/new', to: "sushis#new"  
  # show
  get '/sushis/:id', to: "sushis#show"
  # create
  post '/sushis', to: "sushis#create"



  get '/', to: "sushis#home"
  get '/:anything', to: "application#wrong_page"
end
