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

    filter :status, as: :select, collection: -> { StatusUpdate.status_for_selection }

    def filter_status(matches, value)
      matches.includes(:status_updates).where(status_updates: { status: value })
    end
  end
end
