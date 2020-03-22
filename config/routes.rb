Rails.application.routes.draw do
  get '/signup', to: 'users#new'

  get  '/help',    to: 'start_pages#help'
  get  '/about',   to: 'start_pages#about'
  get  '/contact', to: 'start_pages#contact'
  
  root 'start_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
