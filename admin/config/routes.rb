Admin::Engine.routes.draw do
  resources :matches
  resources :people
  root to: "people#index"
end
