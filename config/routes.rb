Rails.application.routes.draw do
  devise_for :users
   root to:"items#index"
   
   resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :buys, only: [:index, :new, :create, :update]
   end
   resources :users, only: [:new, :create]
end
