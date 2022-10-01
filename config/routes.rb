Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?


  namespace :api do
    namespace :v1 do
      resources :institution, :user
    end
  end

  # namespace :admin do
  #   resources :name, only: %i(index show new create edit update destroy)
  # end

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
