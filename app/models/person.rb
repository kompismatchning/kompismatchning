class Person < ActiveRecord::Base
  has_many :newcomer_matchings, foreign_key: "newcomer_id", class_name: "Matching"
  has_many :established_matchings, foreign_key: "established_id", class_name: "Matching"
end
