class Person < ActiveRecord::Base
  enum gender: { male: 0, female: 1, other: 2 }
  enum status: { established: 0, newcomer: 1 }

  has_many :newcomer_matches, foreign_key: "newcomer_id", class_name: "Match"
  has_many :established_matches, foreign_key: "established_id", class_name: "Match"

  validates :name, presence: true
  validates :age, numericality: { allow_blank: true, only_integer: true }
  validates :email, email: true

  scope :interested, -> { where(engaged: false) }
  scope :engaged, -> { where(engaged: true) }

  def self.gender_for_selection
    genders.keys.map { |gender| [I18n.t("activerecord.attributes.person.genders.#{gender}"), gender] }
  end

  def self.status_for_selection
    statuses.keys.map { |status| [I18n.t("activerecord.attributes.person.statuses.#{status}"), status] }
  end

  def current_match
    Match.where("newcomer_id = ? OR established_id = ?", id, id).last
  end

  def currently_matched_with
    current_match.matched_with(self)
  end

  def to_s
    name
  end
end
