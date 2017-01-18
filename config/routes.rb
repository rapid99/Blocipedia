Rails.application.routes.draw do

  devise_for :users

  resources :wikis

  resources :users


  root 'welcome#index'
end
