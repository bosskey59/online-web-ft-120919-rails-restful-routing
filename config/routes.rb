Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #index
  # get '/sushis', to: "sushis#index"
  # # new
  # get '/sushis/new', to: "sushis#new"  
  # # show
  # get '/sushis/:id', to: "sushis#show", as:"sushi"
  # # create
  # post '/sushis', to: "sushis#create"
  # # edit
  # get '/sushis/:id/edit', to: "sushis#edit", as:"edit_sushi"
  # # update
  # patch '/sushis/:id', to: "sushis#update"
  # destroy
  # delete '/sushis/:id', to:"sushis#destroy"
  resources :sushis do
    resources :ingredients, only: [:index, :show, :new, :create]
  end
  resources :ingredients
  # get '/ingredients', to:"ingredients#index"
  # get '/sushis/:sushi_id/ingredients', to:"ingredients#index"
  # get '/ingredients/:id', to:"ingredients#show"
  # get '/sushis/:sushi_id/ingredients/:id', to:"ingredients#show", as:"sushi_ingredient"




  get '/custom/greeting/:name', to:"custom#greeting"
 
  get '/custom/search', to:"custom#search"
  get '/search', to:"custom#resolved"




  get '/', to: "sushis#home"
  get '/:anything', to: "application#wrong_page"
end
