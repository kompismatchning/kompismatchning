class Interest < ActiveRecord::Base
  has_many :interest_taggings, dependent: :destroy
  has_many :people, through: :interest_taggings
end
