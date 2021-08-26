Rails.application.routes.draw do

  root 'welcome#index'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'
  get '/dashboard', to: 'users#show'

  resources :users, only: [:new, :create]

  namespace :users do
    get '/discover/', to: 'discover#show'
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get '/logout', to: 'sessions#destroy'
end
