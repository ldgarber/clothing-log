Rails.application.routes.draw do
  resources :outfits do 
    get :autocomplete_item_name, :on => :collection
  end
  resources :categories
  resources :items 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index" 
  get "/stats" => "stats#index"
end
