class Match < ActiveRecord::Base
  belongs_to :newcomer, class_name: "Person"
  belongs_to :established, class_name: "Person"

  validates :newcomer, presence: true
  validates :established, presence: true

  validate :newcomer_and_established

  scope :active, -> { where("concluded_at >= ?", Time.zone.now) }
  scope :inactive, -> { where("concluded_at < ?", Time.zone.now) }

  def active?
    concluded_at > Time.zone.now
  end

  def conclude!
    update(concluded_at: Time.zone.now)
  end

  def reactivate!
    update(concluded_at: nil)
  end

  def to_s
    "#{newcomer.name} + #{established.name}"
  end

  private

  def newcomer_and_established
    return if newcomer_id != established_id
    errors.add(:newcomer_id, "can't be same as established")
    errors.add(:established_id, "can't be same as newcomer")
  end
end
