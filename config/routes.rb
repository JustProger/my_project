# frozen_string_literal: true

Rails.application.routes.draw do
  get    '/login'        => 'session#new'
  post   '/login'        => 'session#create'

  get    '/logout'       => 'session#destroy'

  get    '/signup'       => 'users#new'
  post   '/signup'       => 'users#create'

  get    '/profile'      => 'users#profile'
  get    'users/profile'
  get    '/users' => 'users#index'
  get    '/users/edit'
  put    '/users/update'

  get    '/posts' => 'posts#last' # root_path - тот же маршрут
  get    '/posts/show'
  get    '/posts/new'
  post   '/posts' => 'posts#create'
  get    'posts/edit'
  put    'posts/update'

  get    'comments/edit'
  put    'comments/update'
  post   '/comments' => 'comments#create'

  delete 'posts/remove'
  delete 'comments/remove'
  delete 'users/remove'

  root   'posts#last'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
