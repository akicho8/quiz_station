Rails.application.routes.draw do
  get "homes/show"

  devise_for :users

  resources :books
  resources :answer_logs
  resources :hide_marks
  resources :articles do
    patch :answer_logs_create, :on => :member
    patch :mark_update, :on => :member
  end
  put "difficult_level_update" => "homes#difficult_level_update"

  root "articles#index"
end
