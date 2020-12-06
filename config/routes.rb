Rails.application.routes.draw do
  
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :create, :update, :edit]
  
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end
end
