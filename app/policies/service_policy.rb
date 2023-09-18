class ServicePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user.present?
  end

  def show?
    Offer.find_by(offerable: record).visible || Offer.find_by(offerable: record).user == user
  end

  def destroy?
    user == record.user
  end

  def activate?
    user == record.user
  end
end
