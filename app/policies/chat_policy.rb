class ChatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:recipients).where(users: { id: user.id })
    end
  end

  def show?
    record.recipients.include?(user)
  end

  def unsubscribe?
    record.recipients.include?(user)
  end
end
