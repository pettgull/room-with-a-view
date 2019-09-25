Rails.application.routes.draw do
  devise_for :users
  root to: "locations#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :locations, only: [:show]
  resources :bookings, only: [:index]
  namespace :profile do
    resources :locations, except: [:show, :index]
    resources :bookings
  end
end
