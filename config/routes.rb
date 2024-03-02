# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations"
  }
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :librarian do
    resources :librarians, only: [:index, :create, :new]
    resources :books
    resources :users, only: [:index, :show]
  end
  root "home#show"
  resource :user, controller: "user", only: [:show, :edit], path: "/profile"
  resources :books, only: [:index, :show] do
    collection do
      match "search" => "books#search", via: [:get, :post], as: :search
    end
  end
  resources :borrowings, only: [:index, :create, :destroy]
  resource :history, controller: "history", only: [:show]
  resources :book_suggestions, only: [:new, :create]
  resources :reservations, only: [:create, :destroy, :index]
end
