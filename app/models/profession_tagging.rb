# frozen_string_literal: true

class ProfessionTagging < ApplicationRecord
  belongs_to :profession
  belongs_to :person
end
