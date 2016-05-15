module Admin
  class MatchService
    include Godmin::Resources::ResourceService

    attrs_for_index :established, :newcomer, :created_at, :concluded_at
    attrs_for_show :established, :newcomer, :created_at, :concluded_at

    scope :active
    scope :inactive

    def scope_active(matches)
      matches.active
    end

    def scope_inactive(matches)
      matches.inactive
    end
  end
end
