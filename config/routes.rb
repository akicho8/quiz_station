Rails.application.routes.draw do
  resources :missions do
    post :text_post, :on => :collection
  end

  root "missions#index"
end
