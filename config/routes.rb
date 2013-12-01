Ghettoblaster::Application.routes.draw do
  resources :subscribers, only: [:index, :create] do
    collection { delete :destroy }
  end

  get '/thanks' => 'subscribers#thanks'

  # Unsubscribe form
  get '/unsubscribe' => 'subscribers#unsubscribe'
  get '/unsubscribe/thanks' => 'subscribers#unsubscribe_thanks'

  root to: 'subscribers#index'
end
