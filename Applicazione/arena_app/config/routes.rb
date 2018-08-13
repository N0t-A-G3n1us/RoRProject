Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  default_url_options :host => "localhost:3000"
  get 'sessions/new'
  #This new pattern routes a GET request for the URL /help to the help action in the Static Pages controller. As with the rule for the root route, this creates two named routes, help_path and help_url
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/home',   to: 'static_pages#home'
  get  '/signup',  to: 'gamers#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :gamers
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
