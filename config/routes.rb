Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'


  namespace :api do
    namespace :v1 do
      resources :institution, :user
    end
  end

  # get 'institution/index'
  # get 'institution/show'
  # patch 'institution/update'
  # delete 'institution/destroy'
  # post 'institution/create'
  # get 'user/index'
  # get 'user/show'
  # patch 'user/update'
  # delete 'user/destroy'
  # post 'user/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
