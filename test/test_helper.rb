# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
require "rails/test_help"

module ActiveSupport
  class TestCase
    def create_person(name: "Lorem Ipsum", engaged: false, status: :newcomer)
      Person.create!(
        name: name,
        email: "user_#{rand(5..30)}@example.com",
        status: status,
        engaged: engaged
      )
    end

    def create_match(newcomer: nil, established: nil, started_at: nil, concluded_at: nil)
      Match.create!(
        newcomer: newcomer,
        established: established,
        started_at: started_at,
        concluded_at: concluded_at,
        send_follow_up_mail: true,
        send_conclusion_mail: true
      )
    end
  end
end
