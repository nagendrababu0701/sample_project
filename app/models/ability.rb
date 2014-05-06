class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
 
    if user.roles.eql?('admin')
      can :manage, :all
    elsif user.roles.eql?('guest')
      can :read, [Product,Category]
    end
  end
end
