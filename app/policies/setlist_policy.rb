class SetlistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
        scope.where(setlist: user.setlists)
    end
  end


  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    admin? || scope.where(user: user)
  end

  def edit?
    update?
  end

  def destroy?
    admin? || scope.where(user: user)
  end
end
