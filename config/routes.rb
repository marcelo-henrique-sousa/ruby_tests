Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  resources :wepons, except: [:new, :edit, :update]
  resources :enemies, only: [:update, :destroy]
end
