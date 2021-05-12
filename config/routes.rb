Rails.application.routes.draw do
  devise_for :user
  root to: "items#index"

  resources :items do
    resources :orders, only: [:index, :create]
  end
  
end
