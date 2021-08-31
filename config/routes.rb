Rails.application.routes.draw do

  root 'welcome#index'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  resources :users, only: [:new, :create] do
    member { get 'dashboard' }
    # resources :parties, only: [:new, :create] 
    # member { resources :party, only: [:new, :create]}
    get '/parties/new', to: 'parties#new'
    post '/parties/new', to: 'parties#create'
  end
  

  get '/discover/', to: 'discover#show'

  resources :movies, only: [:index, :show]
  resources :friendships, only: :create

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get '/logout', to: 'sessions#destroy'
end
