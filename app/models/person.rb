class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    return if value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    record.errors[attribute] << (options[:message] || "is not an email")
  end
end

class Person < ActiveRecord::Base
  enum gender: { male: 0, female: 1, other: 2 }

  has_many :newcomer_matches, foreign_key: "newcomer_id", class_name: "Match"
  has_many :established_matches, foreign_key: "established_id", class_name: "Match"

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
