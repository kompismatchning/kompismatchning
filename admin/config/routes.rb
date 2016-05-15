Admin::Engine.routes.draw do
  root to: "people#index"
  resources :matches do
    get "conclude", on: :member
    get "reactivate", on: :member
  end
  resources :people
  resource :session, only: [:new, :create, :destroy]
end
