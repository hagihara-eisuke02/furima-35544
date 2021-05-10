Rails.application.routes.draw do
  devise_for :user
  root to: "items#index"

  resources :items
  
end
