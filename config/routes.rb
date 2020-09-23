Rails.application.routes.draw do
  root to: "ingredients#index"
  
  resources :ingredients do
  end
   

  post "ingredients/like", :to => "ingredients#like"
end
