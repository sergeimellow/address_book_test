Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :contacts
  end
  root to: 'books#index'
end
