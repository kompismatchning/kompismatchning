ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  def create_established_person
    create_person(:established)
  end

  def create_newcomer_person
    create_person(:newcomer)
  end

  def create_person(status)
    Person.create!(
      name: "Name",
      gender: :female,
      age: 27,
      email: "user_#{rand(5..30)}@example.com",
      status: :newcomer,
      engaged: false
    )
  end

  def create_match
    established = create_established_person
    newcomer = create_established_person

    Match.create!(newcomer: newcomer, established: established)
  end
end
