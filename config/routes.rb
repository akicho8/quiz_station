Rails.application.routes.draw do
  resources :books
  resources :answer_logs
  resources :important_marks
  get 'home/index'

  devise_for :users
  resources :articles do
    patch :answer_logs_create, :on => :member
    patch :mark_update, :on => :member
  end

  # root "articles#index"

  root to: "articles#index"
end
