Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  root 'sessions#new'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy'
  resources :friends 
  resources :users
  resources :sessions
  resources :mails
end
