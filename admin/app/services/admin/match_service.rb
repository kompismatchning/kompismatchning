module Admin
  class MatchService
    include Godmin::Resources::ResourceService

    attrs_for_index :id, :newcomer, :established, :status
    attrs_for_show :id, :newcomer, :established, :started_at, :concluded_at, :follow_up_mail_sent_at, :conclusion_mail_sent_at, :comment

    def resources(params)
      super(params).order(started_at: :desc)
    end

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
      matches.joins(:status_updates)
             .where("status_updates.created_at = (SELECT MAX(status_updates.created_at)
                                                         FROM status_updates
                                                         WHERE status_updates.match_id = matches.id)")
             .where(status_updates: { status: value })
             .group("matches.id")
    end

    def order_by_status(resources, direction)
      resources.order("started_at #{direction}")
    end
  end
end
