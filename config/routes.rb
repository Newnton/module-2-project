Rails.application.routes.draw do
  root 'static#home'
  resources :sessions
  resources :comments
  resources :posts
  resources :communities
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
