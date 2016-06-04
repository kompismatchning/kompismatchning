module Admin
  class PersonService
    include Godmin::Resources::ResourceService

    attrs_for_index :name, :gender, :age, :email, :status, :last_matched_at
    attrs_for_show :name, :gender, :age, :email, :phone_number, :status, :engaged, :comment

    scope :interested
    scope :engaged

    def scope_interested(people)
      people.interested
    end

    def scope_engaged(people)
      people.engaged
    end

    filter :name
    filter :gender, as: :select, collection: -> { Person.gender_for_selection }
    filter :status, as: :select, collection: -> { Person.status_for_selection }

    def filter_name(people, value)
      people.where("name LIKE ?", "%#{value}%")
    end

    def filter_gender(people, value)
      people.where(gender: Person.genders[value])
    end

    def filter_status(people, value)
      people.where(status: Person.statuses[value])
    end

    batch_action :engage, only: [:interested]

    def batch_action_engage(people)
      people.update_all(engaged: true)
    end
  end
end
