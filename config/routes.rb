Rails.application.routes.draw do
  get "/foo", to: "welcome#foo"
  mount Admin::Engine, at: "admin"
end
