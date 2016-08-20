module Admin
  class MatchService
    include Godmin::Resources::ResourceService

    attrs_for_index :established, :newcomer, :created_at, :concluded_at
    attrs_for_show :established, :newcomer, :created_at, :concluded_at, :comment

    scope :active
    scope :inactive

    def scope_active(matches)
      matches.active
    end

    def scope_inactive(matches)
      matches.inactive
    end

    def create_resource(resource)
      resource.concluded_at = 6.months.from_now
      resource.save!
    end
  end
end
