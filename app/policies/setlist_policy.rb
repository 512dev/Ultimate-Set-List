class SetlistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
        scope.where(setlist: user.setlists)
    end
  end


  def index?
    scope
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    scope
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
    curator_or_admin?
  end
end
