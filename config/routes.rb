Rails.application.routes.draw do
  root to: "welcome#index"
  mount Admin::Engine, at: "admin"
end
