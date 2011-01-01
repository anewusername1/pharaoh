class Ability
  include CanCan::Ability
  
  def initialize(user)
    return false if(user.blank?)
    can :manage, :all if user.role == "admin"
  end
end
