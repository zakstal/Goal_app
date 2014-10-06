Rails.application.routes.draw do
  root to: "users#new"

  resource :user, only: [:new, :create] do
    resources :goals, only: [:index, :show, :new]
  end

  resource :session, only: [:new, :create, :destroy]
end