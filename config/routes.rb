Rails.application.routes.draw do
  resources :airports,  only: [:new, :create, :index, :show]
  resources :flights,   only: [:new, :create, :index, :show]

  root 'flight#index'

end
