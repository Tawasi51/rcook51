Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    end

  root to: "ingredients#index"
  
  resources :ingredients 
   
  post "ingredients/like", :to => "ingredients#like"
end
