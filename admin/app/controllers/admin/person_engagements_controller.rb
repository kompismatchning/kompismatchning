# frozen_string_literal: true

require_dependency "admin/application_controller"

module Admin
  class PersonEngagementsController < ApplicationController
    def create
      @person = Person.find params[:person_id]
      @person.engage
      redirect_to people_path(scope: :engaged), notice: "Person intervjuades"
    end
  end
end
