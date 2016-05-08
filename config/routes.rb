Rails.application.routes.draw do
  devise_for :users
  resources :books do
  	collection { post :import }
    resources :contacts
  end
  root to: 'books#index'
end
