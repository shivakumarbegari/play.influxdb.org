Play::Application.routes.draw do
  namespace :api do
    resources :users, only: :create
  end

  root to: "databases#new"
  resources :databases, only: [:create, :new]
end
