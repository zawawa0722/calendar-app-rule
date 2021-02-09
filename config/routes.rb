Rails.application.routes.draw do
  devise_for :users
  root to: "entrances#index"

  resources :events 
  resources :finances, only:[:index, :show]
  resources :entrances, only:[:index]
  get "/events/finances/show", to: "finances#show"
  patch "/events", to: "events#update"
  # get "/events/finances/events", to: "events#index"
end