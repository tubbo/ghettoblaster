Ghettoblaster::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  resources :subscribers, only: [:index, :create]
  get '/:id' => 'high_voltage/pages#show' # all static pages
  root to: 'subscribers#index'
end
