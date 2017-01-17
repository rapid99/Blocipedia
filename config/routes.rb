Rails.application.routes.draw do
  devise_for :users

  resources :wiki
  post 'wiki/new'
  post 'wiki/create'

  resources :users

  root 'welcome#index'
end
