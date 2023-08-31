class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def edit?
    # NOTE: Only the user can edit their own profile
    user == record
  end

  def update?
    edit?
  end
end
