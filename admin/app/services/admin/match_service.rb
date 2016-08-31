module Admin
  class MatchService
    include Godmin::Resources::ResourceService

    attrs_for_index :established, :newcomer, :started_at, :concluded_at
    attrs_for_show :established, :newcomer, :started_at, :concluded_at, :comment

    scope :pending
    scope :active
    scope :inactive

    def scope_pending(matches)
      matches.pending
    end

    def scope_active(matches)
      matches.active
    end

    def scope_inactive(matches)
      matches.inactive
    end
  end
end
