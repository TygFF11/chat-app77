Rails.application.routes.draw do

  resources :rooms, only:[:new,:create] do
    resources :messages, only:[:index,:create]
  end

  devise_for :users
  root to: "rooms#index"
  resources :users, only:[:edit,:update]

end
