Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"
  # get "recipes", to: "recipes#index"
  resources :recipes do
    resources :reviews, only: [ :new, :create ]
  end
  resources :reviews, only: [ :destroy ]
  get "recipes/busca", to: "recipes#busca"
end
