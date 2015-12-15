Rails.application.routes.draw do
  root 'home#index'
  resources :jobs, only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:new, :create, :show]
  resources :categories, only: [:show]
end
