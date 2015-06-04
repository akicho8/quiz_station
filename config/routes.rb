Rails.application.routes.draw do
  resources :articles do
    patch :answered_counter_inc, :on => :member
  end

  root "articles#index"
end
