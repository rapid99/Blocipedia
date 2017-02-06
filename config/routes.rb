Rails.application.routes.draw do

  devise_for :users


  resources :wikis do
    resources :collaborations
  end



  resources :users

  resources :charges, only: [:new, :create]

  root 'welcome#index'
end
