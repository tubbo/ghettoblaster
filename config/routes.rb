Ghettoblaster::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  resources :subscribers, only: %w(index create destroy)

  get '/thanks' => 'subscribers#thanks'

  # Unsubscribe form
  get '/unsubscribe' => 'subscribers#unsubscribe'
  get '/unsubscribe/thanks' => 'subscribers#unsubscribe_thanks'

  root to: 'subscribers#index'
end
