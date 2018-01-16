Rails.application.routes.draw do
  root to: "site#index"

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
  	resources :posts, only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  get '/logout', to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  get "/posts", to: "posts#index", as: "posts"
  get "/posts/:id", to: "posts#show", as: "post"
  get "/cities/:name/posts/new", to: "posts#new", as: "new_post"
  post "/cities/:name/posts", to: "posts#create"
  get "/posts", to: "posts#destroy"
  get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  put "/posts/:id", to: "posts#update"


  get "/cities", to: "cities#index"
  get "/cities/:name", to: "cities#show", as: "city"

end
