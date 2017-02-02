module Admin
  class PersonService
    include Godmin::Resources::ResourceService

    attrs_for_index :name, :gender, :age, :email, :status, :country, :matched_with
    attrs_for_show :name, :id_number, :gender, :age, :email, :phone_number, :status, :country, :matched_with, :profession_list, :interest_list, :comment, :contact_preference
    attrs_for_export :name, :id_number, :gender, :age, :email, :phone_number

    def resources(params)
      super(params).order(name: :asc)
    end

    scope :all
    scope :interested
    scope :engaged, default: true
    scope :pending
    scope :active
    scope :concluded

    def scope_all(people)
      people
    end

    def scope_interested(people)
      people.interested
    end

    def scope_engaged(people)
      people.engaged
    end

    def scope_pending(people)
      people.pending
    end

    def scope_active(people)
      people.active
    end

    def scope_concluded(people)
      people.concluded
    end

    filter :name
    filter :gender, as: :select, collection: -> { Person.gender_for_selection }
    filter :status, as: :select, collection: -> { Person.status_for_selection }
    filter :country, as: :select, collection: -> { Person.country_for_selection }

    def filter_name(people, value)
      people.where("LOWER(name) LIKE LOWER(?)", "%#{value}%")
    end

    def filter_gender(people, value)
      people.where(gender: Person.genders[value])
    end

    def filter_status(people, value)
      people.where(status: Person.statuses[value])
    end

    def filter_country(people, value)
      people.where(country: value)
    end
  end
end
