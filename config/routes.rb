Rails.application.routes.draw do
  resources :cards
  namespace :api do
    namespace :v1 do
      resources :positions
      resources :card_unlocks
      resources :spreads
      resources :users
    end
  end
end
