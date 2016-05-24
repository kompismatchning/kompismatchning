require_dependency "admin/application_controller"

module Admin
  class MatchConclusionsController < ApplicationController
    def create
      @match = Match.find params[:match_id]
      @match.conclude!
      redirect_to @match, notice: "Matchingen avslutades"
    end

    def destroy
      @match = Match.find params[:match_id]
      @match.reactivate!
      redirect_to @match, notice: "Matchingen återaktiverades"
    end
  end
end
