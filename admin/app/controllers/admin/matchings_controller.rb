require_dependency "admin/application_controller"

module Admin
  class MatchingsController < ApplicationController
    include Godmin::Resources::ResourceController
  end
end
