require_dependency "admin/application_controller"

module Admin
  class SessionsController < ApplicationController
    include Godmin::Authentication::SessionsController
  end
end
