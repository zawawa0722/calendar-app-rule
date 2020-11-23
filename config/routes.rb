Rails.application.routes.draw do
  root to: "entrances#index"
  get "events", to: "events#index"
  get "finances", to: "finances#show"
  get "chart", to: "finances#index"
  resources :events, :entrances, :finances
end