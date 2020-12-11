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
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    user && user == record.user || user && user.is_admin?
  end

end
