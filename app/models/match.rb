class Match < ActiveRecord::Base
  belongs_to :newcomer, class_name: "Person"
  belongs_to :established, class_name: "Person"

  validates :newcomer, presence: true
  validates :established, presence: true

  validate :newcomer_and_established_are_different, on: :create
  validate :newcomer_and_established_are_unmatched, on: :create

  def matched_with(person)
    newcomer == person ? established : newcomer
  end

  scope :pending, -> { where(started_at: nil) }
  scope :started, -> { where.not(started_at: nil) }
  scope :active, -> { started.where("concluded_at >= ?", Time.zone.now) }
  scope :inactive, -> { started.where("concluded_at < ?", Time.zone.now) }

  def pending?
    started_at.nil?
  end

  def started?
    !pending?
  end

  def active?
    started? && concluded_at >= Time.zone.now
  end

  def inactive?
    started? && concluded_at < Time.zone.now
  end

  def start
    update(started_at: Time.zone.now, concluded_at: 6.months.from_now)
  end

  def conclude
    update(concluded_at: Time.zone.now)
  end

  def to_s
    "#{newcomer.name} + #{established.name}"
  end

  private

  def newcomer_and_established_are_different
    return if newcomer_id != established_id
    errors.add(:newcomer_id, "can't be same as established")
    errors.add(:established_id, "can't be same as newcomer")
  end

  def newcomer_and_established_are_unmatched
    errors.add(:newcomer_id, "can't have existing match") if newcomer.current_match.present?
    errors.add(:established_id, "can't have existing match") if established.current_match.present?
  end
end
