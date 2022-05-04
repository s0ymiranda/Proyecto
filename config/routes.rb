Rails.application.routes.draw do
  resources :state_projects
  resources :projects
  resources :states
  resources :clients
  resources :cities
  resources :estados
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/projects/status/:id', to: 'projects#status'
 
  # Defines the root path route ("/")
  # root "articles#index"
end
