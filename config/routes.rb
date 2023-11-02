Rails.application.routes.draw do
  root "wishes#index"

  resources :wishes

  get 'signup' => 'users#new'
  resources :users
end
