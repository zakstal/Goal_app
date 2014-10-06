Rails.application.routes.draw do
  root to: "users#new"

  resources :users, only: [:new, :create, :show, :index] do
    resources :goals, only: [:index, :new]
  end

  resources :goals, only: [:create, :edit, :show, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]

  resources :comments, only: :create
end