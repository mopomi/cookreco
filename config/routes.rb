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
  get "users/:id/likes" => "users#likes"
  post   '/like/:recipe_id' => 'likes#like',   as: 'like'
  delete '/like/:recipe_id' => 'likes#unlike', as: 'unlike'
end