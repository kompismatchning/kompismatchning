class Person < ApplicationRecord
  enum contact_preference: { email: 0, phone: 1 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum status: { established: 0, newcomer: 1 }

  has_many :newcomer_matches, foreign_key: "newcomer_id", class_name: "Match"
  has_many :established_matches, foreign_key: "established_id", class_name: "Match"

  validates :name, presence: true
  validates :age, numericality: { allow_blank: true, only_integer: true }
  validates :email, email: true

  scope :unmatched, (lambda {
    joins("LEFT JOIN matches
           ON matches.newcomer_id = people.id
           OR matches.established_id = people.id").where("matches.id IS NULL")
  })

  scope :matched, (lambda {
    joins("INNER JOIN matches
           ON matches.newcomer_id = people.id
           OR matches.established_id = people.id")
  })

  scope :interested, (-> { unmatched.where(engaged: false) })
  scope :engaged, (-> { unmatched.where(engaged: true) })
  scope :pending, (-> { matched.where(matches: { id: Match.pending }) })
  scope :active, (-> { matched.where(matches: { id: Match.active }) })
  scope :concluded, (-> { matched.where(matches: { id: Match.concluded }) })

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

  def interested?
    !engaged?
  end

  def engage
    update(engaged: true)
  end

  def current_match
    Match.active.where("newcomer_id = ? OR established_id = ?", id, id).last
  end

  def currently_matched_with
    current_match.matched_with(self)
  end

  def to_s
    name
  end

  concerning :Interests do
    included do
      has_many :interests, through: :interest_taggings
      has_many :interest_taggings, dependent: :destroy
    end

    def interest_list
      interests.map(&:name).join(", ")
    end

    def interest_list=(value)
      self.interests = value.split(",").map(&:strip).uniq.map do |interest|
        Interest.find_or_initialize_by(name: interest)
      end
    end
  end

  concerning :Professions do
    included do
      has_many :professions, through: :profession_taggings
      has_many :profession_taggings, dependent: :destroy
    end

    def profession_list
      professions.map(&:name).join(", ")
    end

    def profession_list=(value)
      self.professions = value.split(",").map(&:strip).uniq.map do |profession|
        Profession.find_or_initialize_by(name: profession)
      end
    end
  end
end
