Rails.application.routes.draw do
  get "/foo", to: "welcome#foo"
  get "/bar", to: "welcome#bar"
  mount Admin::Engine, at: "admin"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
