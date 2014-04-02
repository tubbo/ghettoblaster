Ghettoblaster::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  resources :subscribers, only: %w(index create destroy)

  get '/thanks' => 'subscribers#thanks'
  root to: 'subscribers#index'
end
