# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.librarian?
      can [:read, :create], :librarian
      can [:read], :user
      can :manage, :book
    end
  end
end
