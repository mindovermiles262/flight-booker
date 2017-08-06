Rails.application.routes.draw do
  root 'flights#index'
  resources :flights, only: [:index]
  resources :bookings
  get 'flights', to: 'flights#index'
end
