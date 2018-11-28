# frozen_string_literal: true

class InterestTagging < ApplicationRecord
  belongs_to :interest
  belongs_to :person
end
