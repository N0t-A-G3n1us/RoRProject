Rails.application.routes.draw do
  #This new pattern routes a GET request for the URL /help to the help action in the Static Pages controller. As with the rule for the root route, this creates two named routes, help_path and help_url
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/home',   to: 'static_pages#home'
  get  '/signup',  to: 'gamers#new'
  resources :gamers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
