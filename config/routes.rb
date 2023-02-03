Rails.application.routes.draw do
  
  default_url_options :host => "localhost:3000" 
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'

  root "static_pages#home"
    get "/help", to: 'static_pages#help'
    get "/about", to: 'static_pages#about'
    get "/contact", to: 'static_pages#contact'
    get '/microposts', to: 'static_pages#home'
    get "/signup", to: 'users#new'
    get "/login", to: 'sessions#new'
   

    post "/login", to: 'sessions#create'

    delete "/logout", to: 'sessions#destroy'
    
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]
    resources :microposts,          only: [:create, :destroy]
    resources :relationships,       only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  
end
