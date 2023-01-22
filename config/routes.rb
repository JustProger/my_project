Rails.application.routes.draw do
  get    '/login'     => 'session#new'
  post   '/login'     => 'session#create'
 
  get    '/logout'    => 'session#destroy'

  get    '/signup'    => 'users#new'
  post   '/signup'    => 'users#create'

  get    '/profile'   => 'users#profile'
  get    'users/profile'
 
  get    '/new' => 'posts#last'
  get    '/posts/show'

  get    '/posts/new'
  post   '/posts'     => 'posts#create'
  post   '/comments'  => 'comments#create'

  get 'posts/edit'
  put 'posts/update'

  delete 'posts/remove'
  delete 'comments/remove'

  root   'posts#last'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
