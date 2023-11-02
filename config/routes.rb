Rails.application.routes.draw do
  root "wishes#index"

  resources :wishes

  get 'signup', to 'users#new'
  resources :users
end
