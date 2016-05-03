class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    record.errors[attribute] << (options[:message] || "is not an email")
  end
end

class Person < ActiveRecord::Base
  enum gender: { female: 0, male: 1, other: 2 }

  has_many :newcomer_matchings, foreign_key: "newcomer_id", class_name: "Matching"
  has_many :established_matchings, foreign_key: "established_id", class_name: "Matching"

  validates :name, presence: true
  validates :established, inclusion: { in: [true, false] }
  validates :age, numericality: { allow_blank: true, only_integer: true }
  validates :email, email: true

  scope :interested, -> { where(engaged: false) }
  scope :engaged, -> { where(engaged: true) }
  scope :established, -> { where(established: true) }
  scope :newcomers, -> { where(established: false) }

  def to_s
    name
  end
end
