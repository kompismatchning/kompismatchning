module Admin
  class MatchService
    include Godmin::Resources::ResourceService

    attrs_for_index :established, :newcomer, :created_at_as_date, :concluded_at_as_date
    attrs_for_show :established, :newcomer, :created_at_as_date, :concluded_at_as_date, :comment

    scope :active
    scope :inactive

    def scope_active(matches)
      matches.active
    end

    def scope_inactive(matches)
      matches.inactive
    end

    def order_by_created_at_as_date(resources, direction)
      resources.order("created_at #{direction}")
    end

    def order_by_concluded_at_as_date(resources, direction)
      resources.order("concluded_at #{direction}")
    end

    def create_resource(resource)
      resource.concluded_at = 6.months.from_now
      resource.save!
    end
  end
end
