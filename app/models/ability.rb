class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Outfit, user_id: user.id
    can :read, Outfit, private: false

    can :manage, Item, user_id: user.id
    can :manage, Category, user_id: user.id
  end
end
