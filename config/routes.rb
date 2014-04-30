Ghettoblaster::Application.routes.draw do
  devise_for :users

  resources :subscribers
  resources :blasts
  resources :users, only: %w(index show)

  root to: 'application#index'
  get '/*path' => 'application#index'
end
