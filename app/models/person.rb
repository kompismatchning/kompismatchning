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

  def self.genders_for_selection
    genders.keys.map { |gender| [I18n.t("activerecord.attributes.person.genders.#{gender}"), gender] }
  end

  def last_match
    Match.where("newcomer_id = ? OR established_id = ?", id, id).last
  end

  def to_s
    name
  end
end
