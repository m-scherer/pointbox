Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :rewards
    resources :user do
      resources :point_transactions
    end
  end

  resources :rewards, only: [:show, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

   root :to => 'rewards#index'
end
