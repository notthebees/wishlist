Rails.application.routes.draw do
  root "home#index"

  get 'signup' => 'users#new'
  resources :users, only: [:new, :create, :show]  do
    resources :wishes
    post 'add_friend', on: :member
  end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
