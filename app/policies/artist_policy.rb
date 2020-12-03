class ArtistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      #scope.where(user: user) #to display only created by me !
    end
  end
  def index?
    true
  end

  def create?
    true
  end
  def show?
    true
  end

  def update?
    record.user == user || user.is_admin? #via keywords : uniquement le "user" qui a créé & détient le "record" !
  end

  def destroy?
    record.user == user || user.is_admin?
  end
end
