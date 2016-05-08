module Admin
  class ApplicationController < ActionController::Base
    include Godmin::ApplicationController
    include Godmin::Authentication

    def admin_user_class
      Admin::AdminUser
    end
  end
end
