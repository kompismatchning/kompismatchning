Rails.application.routes.draw do
  get "/foo", to: "welcome#foo"
  get "/bar", to: "welcome#bar"
  mount Admin::Engine, at: "admin"
end
