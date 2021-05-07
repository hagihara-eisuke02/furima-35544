Rails.application.routes.draw do
  devise_for :user
  root to: "items#index"

  resources :items, only: [:index, :new, :create, :show] do

  end
  
end
