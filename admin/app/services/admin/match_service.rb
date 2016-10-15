module Admin
  class MatchService
    include Godmin::Resources::ResourceService

    attrs_for_index :established, :newcomer, :started_at, :concluded_at, :status
    attrs_for_show :established, :newcomer, :started_at, :concluded_at, :comment

    scope :pending
    scope :active, default: true
    scope :concluded

    def scope_pending(matches)
      matches.pending
    end

    def scope_active(matches)
      matches.active
    end

    def scope_concluded(matches)
      matches.concluded
    end

    filter :name
    filter :status, as: :select, collection: -> { StatusUpdate.status_for_selection }

    def filter_name(matches, value)
      matches.joins("INNER JOIN people
                     ON matches.newcomer_id = people.id
                     OR matches.established_id = people.id").where("LOWER(people.name) LIKE LOWER(?)", "%#{value}%")
    end

    def filter_status(matches, value)
      matches.includes(:status_updates).where(status_updates: { status: value })
    end
  end
end
