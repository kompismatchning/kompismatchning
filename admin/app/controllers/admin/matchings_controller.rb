require_dependency "admin/application_controller"

module Admin
  class MatchingsController < ApplicationController
    include Godmin::Resources::ResourceController

    private

    def resource_params
      params.require(:matching).permit(:established_id, :newcomer_id)
    end
  end
end
