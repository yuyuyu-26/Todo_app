Rails.application.routes.draw do
  get 'start_pages/home'
  get 'start_pages/help'
  get 'start_pages/about'
  get 'start_pages/contact'
  
  root 'start_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
