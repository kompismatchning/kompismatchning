# frozen_string_literal: true

require_dependency "admin/application_controller"

module Admin
  class MatchActivationsController < ApplicationController
    def create
      @match = Match.find params[:match_id]
      @match.activate
      redirect_to matches_path(scope: :active), notice: "Matchingen startades"
    end
  end
end
