Rails.application.routes.draw do
  devise_for :users
  root to: "ingredients#index"
  
  resources :ingredients do
  end
   

  post "ingredients/like", :to => "ingredients#like"
end
