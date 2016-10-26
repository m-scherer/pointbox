Rails.application.routes.draw do
  resources :rewards, only: [:index, :show, :new, :create]

  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

   root :to => 'rewards#index'
end
