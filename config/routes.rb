Rails.application.routes.draw do
  resources :missions do
    post :text_post, :on => :collection
    patch :marubatu, :on => :member
    patch :marubatu2, :on => :member
  end

  root "missions#index"
end
