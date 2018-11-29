# frozen_string_literal: true

class Interest < ApplicationRecord
  has_many :interest_taggings, dependent: :destroy
  has_many :people, through: :interest_taggings
end
