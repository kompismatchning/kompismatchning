# frozen_string_literal: true

require_dependency "admin/application_controller"

module Admin
  class PeopleController < ApplicationController
    include Godmin::Resources::ResourceController

    private

    def resource_params
      params.require(:person).permit(
        :age,
        :comment,
        :contact_preference,
        :country,
        :email,
        :engaged,
        :gender,
        :id_number,
        :interest_list,
        :name,
        :phone_number,
        :profession_list,
        :status
      )
    end

    def redirect_after_batch_action_engage
      people_path(scope: :engaged)
    end
  end
end
