Rails.application.routes.draw do
  root "home#index"

  get 'signup' => 'users#new'
  resources :users do
    resources :wishes
  end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
