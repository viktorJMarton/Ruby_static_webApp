Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  default_url_options :host => "localhost:3000" #TODO: Ask about this  problem. Listing 11.18 
  get 'sessions/new'
  get 'users/new'

  root "static_pages#home"
    get "/help", to: 'static_pages#help'
    get "/about", to: 'static_pages#about'
    get "/contact", to: 'static_pages#contact'
    get "/signup", to: 'users#new'
    get "/login", to: 'sessions#new'
    post "/login", to: 'sessions#create'
    delete "/logout", to: 'sessions#destroy'
    
    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  
end
