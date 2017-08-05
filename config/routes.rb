Rails.application.routes.draw do
  resources :airports
  root 'flights#show'
end
