# frozen_string_literal: true

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
      true
    end
  end
end
