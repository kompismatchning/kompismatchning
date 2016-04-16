Admin::Engine.routes.draw do
  resources :matchings
  resources :people
  root to: "application#welcome"
end
