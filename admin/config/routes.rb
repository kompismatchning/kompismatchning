Admin::Engine.routes.draw do
  root to: "people#index"
  resources :matches
  resources :people
  resource :session, only: [:new, :create, :destroy]
end
