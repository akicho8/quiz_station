Rails.application.routes.draw do
  resources :article_groups
  resources :answer_logs
  resources :articlemarks
  get 'home/index'

  devise_for :users
  resources :articles do
    patch :answered_counter_inc, :on => :member
    patch :mark_exec, :on => :member
  end

  # root "articles#index"

  root to: "articles#index"
end
