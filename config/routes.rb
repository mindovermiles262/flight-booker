Rails.application.routes.draw do
  root 'flights#index'
  resources :flights, only: [:index]
  resources :bookings
  resources :passengers
  get 'flights', to: 'flights#index'
end
