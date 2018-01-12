Rails.application.routes.draw do
  root to: "site#index"

  get "users/new", to: "users#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
