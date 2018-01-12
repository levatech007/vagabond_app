Rails.application.routes.draw do
  root to: "site#index"

  resources :users, only: [:new, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
