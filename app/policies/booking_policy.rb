class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      return true
    end

    def show
      return true
    end
    
    def edit
      return true
    end  
    
  end
end
