Rails.application.routes.draw do
  resources :articles do
    post :text_post, :on => :collection
    patch :marubatu, :on => :member
    patch :answered_counter_inc, :on => :member
  end

  root "articles#index"
end
