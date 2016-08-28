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
      resource.concluded_at = Rails.configuration.conclude_matches_after.from_now
      resource.save!
    end
  end
end
