class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def dashboard?
      true
    end
  end
end
