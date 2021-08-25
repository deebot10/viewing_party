Rails.application.routes.draw do
  root 'welcome#index'
  get '/registration', to: 'users#new'

  resources :users, only: [:new, :create] do
    member { get 'dashboard'}
    
    resources :discover, only: [:index, :show] 
  end
end
