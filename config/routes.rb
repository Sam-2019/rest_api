Rails.application.routes.draw do
  get 'institution/index'
  get 'institution/show'
  get 'institution/update'
  get 'institution/delete'
  post 'institution/create'
  get 'user/index'
  get 'user/show'
  get 'user/update'
  get 'user/delete'
  post 'user/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
