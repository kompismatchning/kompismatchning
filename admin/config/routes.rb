Admin::Engine.routes.draw do
  root to: "people#index"
  resource :config, only: [:show, :edit, :update]
  resources :matches do
    resource :match_activations, only: [:create]
    resource :match_conclusions, only: [:create]
  end
  resources :people do
    resource :person_engagements, only: [:create]
  end
  resource :session, only: [:new, :create, :destroy]
end
