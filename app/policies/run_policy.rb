class RunPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(status: "scheduled").order(date: :asc).limit(3)
      scope.all
    end
  end

  def create?
    true
  end

  def edit
    update?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    # write the logic for allowing the current user only
    user_is_owner?
    # record.user == user(example)
  end


  private

    def suggestions?
      true
    end

  def user_is_owner?
    # write the user logic here
    record.user == user
    # user == record.camera.user(example)
  end
end
