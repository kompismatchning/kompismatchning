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
  end
end
