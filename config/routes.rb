Ghettoblaster::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  resources :subscribers, only: [:index, :create]
  get '/thanks' => 'high_voltage/pages#show', id: 'thanks'
  root to: 'subscribers#index'
end
