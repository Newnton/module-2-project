Rails.application.routes.draw do
  root 'static#home'
  resources :sessions
  resources :comments, except: :new
  get '/comments/new/:id' => 'comments#new', as: 'new_comment'
  resources :posts, except: :new
  get '/posts/new/:id', to: 'posts#new', as: 'new_post'
  resources :communities
  post '/user_communities/create/:id' => 'user_communities#create', as: 'subscribe'
  resources :users do
    member do
      get :following, :followers
    end
    end
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
