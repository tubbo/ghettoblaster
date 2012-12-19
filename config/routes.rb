Wunderkind::Application.routes.draw do
  resources :subscribers, only: [:index, :create]
  get '/thanks' => 'pages#thanks'
  root to: 'subscribers#index'
end
