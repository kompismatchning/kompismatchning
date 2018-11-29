# frozen_string_literal: true

module Admin
  class AdminUser < ApplicationRecord
    include Godmin::Authentication::User

    def self.login_column
      :email
    end
  end
end
