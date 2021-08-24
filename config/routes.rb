Rails.application.routes.draw do
  root 'welcome#index'
  get '/registration', to: 'users#new'
  get '/dashboard', to: 'users#show'
  resources :users, only: [:new, :create]
end
