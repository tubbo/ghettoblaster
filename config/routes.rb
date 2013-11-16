Ghettoblaster::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  resources :subscribers, only: [:index, :create]

  get '/thanks' => 'subscribers#thanks'
  root to: 'subscribers#index'
end
