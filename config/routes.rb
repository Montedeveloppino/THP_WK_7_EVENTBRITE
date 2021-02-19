Rails.application.routes.draw do
  root 'orders#new'
  resources :orders, only: [:new, :create]
  root "events#index"
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  resources :events
  resources :attendances
  
  resources :users, only: [:edit, :show, :update] do
    resources :avatars, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


