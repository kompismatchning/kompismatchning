# frozen_string_literal: true

class Profession < ApplicationRecord
  has_many :profession_taggings, dependent: :destroy
  has_many :people, through: :profession_taggings
end
