module Admin
  class MatchService
    include Godmin::Resources::ResourceService

    attrs_for_index :established, :newcomer, :created_at
    attrs_for_show :established, :newcomer, :created_at
  end
end
