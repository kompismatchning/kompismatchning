class Person < ActiveRecord::Base
  enum contact_preference: { email: 0, phone: 1 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum status: { established: 0, newcomer: 1 }

  has_many :interests, through: :interest_taggings
  has_many :interest_taggings, dependent: :destroy
  has_many :newcomer_matches, foreign_key: "newcomer_id", class_name: "Match"
  has_many :established_matches, foreign_key: "established_id", class_name: "Match"

  validates :name, presence: true
  validates :age, numericality: { allow_blank: true, only_integer: true }
  validates :email, email: true

  scope :interested, -> { where(engaged: false) }
  scope :engaged, -> { where(engaged: true) }

  def self.contact_preference_for_selection
    contact_preferences.keys.map do |contact_preference|
      [I18n.t("activerecord.attributes.person.contact_preferences.#{contact_preference}"), contact_preference]
    end
  end

  def self.gender_for_selection
    genders.keys.map do |gender|
      [I18n.t("activerecord.attributes.person.genders.#{gender}"), gender]
    end
  end

  def self.status_for_selection
    statuses.keys.map do |status|
      [I18n.t("activerecord.attributes.person.statuses.#{status}"), status]
    end
  end

  def self.country_for_selection
    ISO3166::Country.translations("sv").invert
  end

  def current_match
    Match.where("newcomer_id = ? OR established_id = ?", id, id).last
  end

  def currently_matched_with
    current_match.matched_with(self)
  end

  def interest_list
    interests.map(&:name).join(", ")
  end

  def interest_list=(value)
    self.interests = value.split(",").map(&:strip).uniq.map do |interest|
      Interest.find_or_initialize_by(name: interest)
    end
  end

  def to_s
    name
  end
end
