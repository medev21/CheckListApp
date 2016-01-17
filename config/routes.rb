Rails.application.routes.draw do
  devise_for :users
  resources :items do
    member do
      #this references to the complete action controller
      patch :complete
    end

  end

  root 'items#index'
end
