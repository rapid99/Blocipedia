Rails.application.routes.draw do
  devise_for :users

  resources :wiki

  resources :users

  root 'welcome#index'
end
