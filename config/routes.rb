Ghettoblaster::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  resources :subscribers, only: %w(index create) do
    collection { delete :destroy }
  end

  get '/thanks' => 'subscribers#thanks'
  root to: 'subscribers#index'
end
