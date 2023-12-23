Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/hello', to: 'first#hello'

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # delete '/users/:id', to: 'users#destory'
  # patch '/users/:id', to: 'users#update'
  # 上面五行等价于下面
  resources :users
  resources :sessions, only: [:create]
  delete '/sessions', to: 'sessions#destroy'
  get '/me', to: 'users#me'
  resources :records
end
