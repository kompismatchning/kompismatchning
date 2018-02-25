module Admin
  class PersonPolicy < Godmin::Authorization::Policy
    def index?
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def update?
      true
    end

    def destroy?
      Person.unmatched.include? record
    end
  end
end
