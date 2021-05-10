Rails.application.routes.draw do
  devise_for :user
  root to: "items#index"

  resources :items, only: [:index, :new, :create, :show, :edit, :update] do

  end
  
end
