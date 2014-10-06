Rails.application.routes.draw do
  root to: "users#new"

  resource :user, only: [:new, :create] do
    resources :goals, only: [:index, :show, :new]
  end

  resources :goals, only: [:create, :edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
end