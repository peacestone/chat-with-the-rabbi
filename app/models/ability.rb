class Ability
  include CanCan::Ability

  def initialize(user)
    if user.normal?
      can [:read, :create, :update, :destroy, :edit], Appointment
      can [:read, :update], User, id: user.id
      can [:read, :update, :create], Rabbi

    elsif user.admin?
      can :manage, :all
    end

  end
end
