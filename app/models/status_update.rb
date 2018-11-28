# frozen_string_literal: true

class StatusUpdate < ApplicationRecord
  enum status: { good: 0, warning: 2, bad: 1 }

  belongs_to :match

  validates :status, presence: true

  def self.status_for_selection
    statuses.keys.map do |status|
      [I18n.t("activerecord.attributes.status_update.statuses.#{status}"), status]
    end
  end
end
