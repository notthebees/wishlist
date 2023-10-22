Rails.application.routes.draw do
  get "/wishes", to: "wishes#index"
end
