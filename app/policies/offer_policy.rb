class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end
end
