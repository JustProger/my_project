Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
