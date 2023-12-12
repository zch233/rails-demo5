Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/hello', to: 'first#hello'

  # get '/users', to: 'user#index'
  # get '/users/:id', to: 'user#show'
  # post '/users', to: 'user#create'
  # delete '/users/:id', to: 'user#destory'
  # patch '/users/:id', to: 'user#update'
  # 上面五行等价于下面
  resource :users
  resource :sessions, only: [:create, :destroy]
end
