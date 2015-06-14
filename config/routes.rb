Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :articles do
    patch :answered_counter_inc, :on => :member
  end

  # root "articles#index"

  root to: "home#index"
end
