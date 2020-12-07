class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def update?
    true
  end

  def validate?
    true
  end

  def refused?
    true
  end

  def create?
    true
  end
end
