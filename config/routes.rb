Rails.application.routes.draw do

  resources :rooms, only:[:new,:create]
  devise_for :users
  root to: "messages#index"
  resources :users, only:[:edit,:update]

end
