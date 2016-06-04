require_dependency "admin/application_controller"

module Admin
  class PeopleController < ApplicationController
    include Godmin::Resources::ResourceController

    private

    def resource_params
      params.require(:person).permit(:name, :email, :phone_number, :age, :gender, :status, :engaged, :comment)
    end

    def redirect_after_batch_action_engage
      people_path(scope: :engaged)
    end
  end
end
