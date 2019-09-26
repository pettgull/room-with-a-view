Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :locations, only: [:show, :index] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :update]
  namespace :profile do
    resources :locations, except: [:show, :index]
    #resources :bookings, except: [:create]
    resources :bookings
  end
end
