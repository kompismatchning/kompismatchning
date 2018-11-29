# frozen_string_literal: true

require_dependency "admin/application_controller"

module Admin
  class ConfigsController < ApplicationController
    helper ::MarkdownHelper

    def show
      @config = Config.first
    end

    def edit
      @config = Config.first
    end

    def update
      @config = Config.first

      if @config.update(config_params)
        redirect_to @config
      else
        render :edit
      end
    end

    private

    def config_params
      params.require(:config).permit(
        :mail_from,
        :follow_up_mail_subject,
        :follow_up_mail_content,
        :conclusion_mail_subject,
        :conclusion_mail_content_for_established,
        :conclusion_mail_content_for_newcomer
      )
    end
  end
end
