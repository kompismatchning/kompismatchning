require_dependency "admin/application_controller"

module Admin
  class MatchesController < ApplicationController
    include Godmin::Resources::ResourceController

    def create
      @resource.concluded_at = 6.months.from_now
      super
    end

    private

    def resource_params
      params.require(:match).permit(:established_id, :newcomer_id, :concluded_at)
    end
  end
end
