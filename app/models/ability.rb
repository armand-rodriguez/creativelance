class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      elsif user.is_recruiter?
        can :manage, Job, user_id: user.id
        can :create, Recruiter
        cannot :create, Request
        can :update, Request, recruiter_user_id: user.id
        can :reject, Request, recruiter_user_id: user.id
        can :show, JobPanel, user_id: user.id
        can :show, JobRoom, user_id: user.id
      elsif user.is_freelancer?
        can :read, Job
        can :create, Freelancer
        can :create, Request
        cannot :update, Request
        cannot :reject, Request
        # can :read, JobRoom, authorization_code: user.authorization_code
        can :read, JobRoom do |j|
          j.authorization_code == user.authorization_code || j.authorization_code == user.second_authorization_code || j.authorization_code == user.third_authorization_code || j.authorization_code == user.fourth_authorization_code
        end
      else
        can :create, Account
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
