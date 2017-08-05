Rails.application.routes.draw do
  root 'flights#index'
  resources :flights, only: [:index]
  get 'flights', to: 'flights#index'
end
