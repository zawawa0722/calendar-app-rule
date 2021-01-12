Rails.application.routes.draw do
  devise_for :users
  root to: "entrances#index"
  resources :events
  resources :finances, only:[:index, :show]
  resources :entrances, only:[:index]
end