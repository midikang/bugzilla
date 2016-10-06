class ProjectsController < ApplicationController

	load_and_authorize_resource
	before_action :require_same_user,only: [:edit, :update, :delete]

	def new
		@project = Project.new
	end

	def create
		 @project = Project.new(project_params)
		if @project.save
			flash[:sucess] ="project created sucessfully"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def index
		@projects = current_user.projects
	end

	def show

	end

	def update
		
		if @project.update(project_params)

			flash[:success] = "Project Was updated Successfully"
		
			redirect_to project_path(@project)

		else
			
			render 'show'

		end

	end

	private

	def project_params
		params.require(:project).permit(:title,:des,user_ids: [])
	end
	
	def require_same_user
		if !current_user.projects.exists?(@project)
			flash[:danger] = "your can only access your own records"
		end
	end
end