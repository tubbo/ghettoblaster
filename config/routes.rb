Wunderkind::Application.routes.draw do
  resources :subscribers, only: [:index, :create]
  get '/:id' => 'high_voltage/pages#show' # all static pages
  root to: 'subscribers#index'
end
