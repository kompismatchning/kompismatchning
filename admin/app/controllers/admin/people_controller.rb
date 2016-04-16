require_dependency "admin/application_controller"

module Admin
  class PeopleController < ApplicationController
    include Godmin::Resources::ResourceController
  end
end
