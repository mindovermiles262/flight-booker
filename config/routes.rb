Rails.application.routes.draw do
  root 'flights#index'
  resources :flights, only: [:index]
  resources :bookings, only: [:new, :show, :create]
  resources :passengers, only: [:new]
  get 'flights', to: 'flights#index'
  post 'bookings/new', to: 'bookings#create'
end
