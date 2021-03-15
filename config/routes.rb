Rails.application.routes.draw do
  devise_for :users
  root to: "entrances#index"

  resources :events do
    collection do
      get 'search'
    end
  end

  resources :finances, only:[:index, :show]
  resources :entrances, only:[:index]

  get "/events/finances/show", to: "finances#show"
  # get "/events/search", to: "events#search"
  patch "/events", to: "events#update"

end