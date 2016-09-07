Admin::Engine.routes.draw do
  root to: "people#index"
  resources :matches do
    resource :match_activations, only: [:create]
    resource :match_conclusions, only: [:create]
  end
  resources :people
  resource :session, only: [:new, :create, :destroy]
end
