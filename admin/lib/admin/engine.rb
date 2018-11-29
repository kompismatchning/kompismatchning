# frozen_string_literal: true

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin
  end
end
