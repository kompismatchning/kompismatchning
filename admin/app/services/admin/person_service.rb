module Admin
  class PersonService
    include Godmin::Resources::ResourceService

    attrs_for_index :name, :gender, :age, :email, :established, :last_matched_at
    attrs_for_show :name, :gender, :age, :email, :established, :engaged
    attrs_for_form :name, :gender, :age, :email, :established, :engaged

    scope :interested
    scope :engaged

    def scope_interested(people)
      people.interested
    end

    def scope_engaged(people)
      people.engaged
    end

    filter :name
    filter :gender, as: :select, collection: -> { [:male, :female, :other] }
    filter :established, as: :select, collection: -> { [true, false] }

    def filter_name(people, value)
      people.where("name LIKE ?", "%#{value}%")
    end

    def filter_gender(people, value)
      people.where(gender: Person.genders[value])
    end

    def filter_established(people, value)
      people.where(established: value == "true")
    end

    batch_action :engage, only: [:interested]

    def batch_action_engage(people)
      people.update_all(engaged: true)
    end
  end
end
