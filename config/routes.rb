Rails.application.routes.draw do

  root 'welcome#index'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  resources :users, only: [:new, :create] do
    member { get 'dashboard' }
    member { resources :party, only: [:new, :create]}
  end

  get '/discover/', to: 'discover#show'

  resources :movies, only: [:index, :show]
  resources :friendships, only: :create

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get '/logout', to: 'sessions#destroy'
end
