Rails.application.routes.draw do
  root "wishes#index"

  resources :wishes
end
