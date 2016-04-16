class Matching < ActiveRecord::Base
  belongs_to :newcomer, class_name: "Person"
  belongs_to :established, class_name: "Person"
end
