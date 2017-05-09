require_dependency "admin/application_controller"

module Admin
  class MatchesController < ApplicationController
    include Godmin::Resources::ResourceController

    private

    def resource_params
      params.require(:match).permit(
        :established_id,
        :newcomer_id,
        :started_at,
        :concluded_at,
        :status,
        :comment,
        :send_follow_up_mail,
        :send_conclusion_mail
      )
    end
  end
end
