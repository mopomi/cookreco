Rails.application.routes.draw do
  devise_for :users
  root to:"recipes#index"
  resources :recipes do
    resources :memos, only: :create
    collection do
      get 'search'
    end
  end
  get '/recipes/genre/:id', to: "recipes#genre"
  resources :users, only: :show
end