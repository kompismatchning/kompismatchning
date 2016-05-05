Rails.application.routes.draw do
  root to: "welcome#index"
  get "/foobar", to: "welcome#foobar"
  mount Admin::Engine, at: "admin"
end
