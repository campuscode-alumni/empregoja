Rails.application.routes.draw do
  root 'home#index'
  resources :jobs, only: [:show, :new, :create]
  resources :companies, only: [:new, :create, :show]
end
