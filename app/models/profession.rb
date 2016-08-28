class Profession < ActiveRecord::Base
  has_many :profession_taggings, dependent: :destroy
  has_many :people, through: :profession_taggings
end
