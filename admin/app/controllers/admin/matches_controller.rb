require_dependency "admin/application_controller"

module Admin
  class MatchesController < ApplicationController
    include Godmin::Resources::ResourceController

    def conclude
      Match.find(params[:id]).conclude
      redirect_to resource, notice: "Matchingen avslutades"
    end

    def reactivate
      Match.find(params[:id]).reactivate
      redirect_to resource, notice: "Matchingens avslut ångrades"
    end

    private

    def resource_params
      params.require(:match).permit(:established_id, :newcomer_id)
    end
  end
end
