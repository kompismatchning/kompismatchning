class InterestTagging < ActiveRecord::Base
  belongs_to :interest
  belongs_to :person
end
