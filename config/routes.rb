# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :api do
    namespace :v1 do
      resources :user
      get "dwnld/sprdsht/users" => "user#spreadsheet", :as => :download_spreadsheet_users
      get "dwnld/pdf/user/:id" => "user#pdf", :as => :download_pdf_user
      resources :institution
      get "dwnld/sprdsht/institutions" => "institution#spreadsheet", :as => :download_spreadsheet_institutions
      get "dwnld/pdf/institution/:id" => "institution#pdf", :as => :download_spreadsheet_institution
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
