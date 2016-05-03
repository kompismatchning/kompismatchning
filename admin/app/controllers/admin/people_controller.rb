require_dependency "admin/application_controller"

module Admin
  class PeopleController < ApplicationController
    include Godmin::Resources::ResourceController

    private

    def redirect_after_batch_action_engage
      people_path(scope: :engaged)
    end
  end
end
