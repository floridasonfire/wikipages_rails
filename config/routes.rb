Rails.application.routes.draw do
  resources :categories do
    resources :businesses
  end
end
