Ghettoblaster::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  resources :subscribers, only: [:index, :create] do
    collection { get :refresh }
  end

  get '/thanks' => 'subscribers#thanks'
  root to: 'subscribers#index'
end
