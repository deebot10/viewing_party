Rails.application.routes.draw do
  root 'welcome#index'
  get '/registration', to: 'users#new'

  resources :users, only: [:new, :create] do
    member { get 'dashboard'}
    
    # resources :discover, only: [:index, :show] 

    # get '/discover', to: 'discover#index'
  end
  
  namespace :users do
    get '/discover/', to: 'discover#show'
  end
end
