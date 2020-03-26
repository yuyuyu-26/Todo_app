Rails.application.routes.draw do
  get 'sessions/new'

  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users

  get  '/help',    to: 'start_pages#help'
  get  '/about',   to: 'start_pages#about'
  get  '/contact', to: 'start_pages#contact'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :relationships,       only: [:create, :destroy]
  resources :tasks,    only: [:create, :destroy]
  
  root 'start_pages#home'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resource :user do
    get :search, on: :collection
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
