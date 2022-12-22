Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount Motor::Admin => '/motor_admin'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?


  namespace :api do
    namespace :v1 do
      resources :user
        get "dwnld/sprdsht/users" => "user#spreadsheet", as: :download_spreadsheet_users
        get "dwnld/pdf/user/:id" => "user#pdf", as: :download_pdf_user
      resources :institution
        get "dwnld/sprdsht/institutions" => "institution#spreadsheet", as: :download_spreadsheet_institutions
        get "dwnld/pdf/institution/:id" => "institution#pdf", as: :download_spreadsheet_institution
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
