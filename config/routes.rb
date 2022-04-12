Rails.application.routes.draw do

  resources :rooms, only:[:index,:new,:create]
  devise_for :users
  root to: "rooms#index"
  resources :users, only:[:edit,:update]

end
