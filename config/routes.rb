Rails.application.routes.draw do
  devise_for :users
  root to:"recipes#index"
  resources :recipes, only: [:new, :create, :show, :edit, :update]
end