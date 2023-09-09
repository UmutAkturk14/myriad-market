class ServicePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def destroy?
    record == record.user
  end

  def activate?
    record == record.user
  end
end
