module Admin
  class MatchPolicy < Godmin::Authorization::Policy
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
      false
    end
  end
end
