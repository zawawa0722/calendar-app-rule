Rails.application.routes.draw do
  devise_for :users
  root to: "entrances#index"

  
  resources :events, only:[:index, :new, :create]
  resources :entrances, only:[:index]
  resources :finances, only:[:index, :show]
end