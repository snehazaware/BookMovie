Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/superadmin", as: "rails_admin"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "theatres#index"

  namespace :admin do
    root "screens#index"
    resources :screens, :shows, :bookings
  end

  resources :theatres do
    resources :shows do
      resources :bookings do
      end
    end
  end

  resources :cities
  post "search", to: "theatres#search", as: "search"
 

end
