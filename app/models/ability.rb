class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role.name == "Admin" || user.role.name == "SuperAdmin"
      can :manage, :all
    end
  end
end
