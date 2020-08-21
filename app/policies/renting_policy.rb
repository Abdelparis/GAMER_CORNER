class RentingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update_accepted?
    user_is_owner_or_admin?
  end

  def update_rejected?
    user_is_owner_or_admin?
  end

  def edit_renting?
    true
  end

  def update_renting?
    true
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.board_game.user == user
  end
end
