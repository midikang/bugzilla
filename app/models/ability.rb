class Ability
	include CanCan::Ability

	def initialize(current_user)
		current_user ||= User.new

		if  current_user.role == 'admin'
			can :manage, :all
		end

		if current_user.role == 'dev' 
			can :read, Project
			can :update, Bug
			can :read,Bug
		end

		if current_user.role == 'qae' 
			can :read, Project
			can :create, Bug
			can :read, Bug
		end

	end
end