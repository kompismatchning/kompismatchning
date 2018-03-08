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
      if record.newcomer?
        record.newcomer_matches.empty?
      else
        record.established_matches.empty?
      end
    end
  end
end
