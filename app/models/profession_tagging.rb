class ProfessionTagging < ActiveRecord::Base
  belongs_to :profession
  belongs_to :person
end
