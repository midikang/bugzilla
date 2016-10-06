class BugsController <ApplicationController

	load_and_authorize_resource :Project
 	load_and_authorize_resource :Bug, :through => :Project

    before_action :require_same_user,only: [:edit, :update, :delete]
	
	def new
		@bug = Bug.new
	end

	def create
		@bug = Bug.new(params_bug)
		@bug.project = Project.find(params[:project_id])
		current_user.bugs << @bug
		
		if current_user.save
			flash[:success] = "Bug posted Successfully"
			redirect_to project_path(Project.find(params[:project_id]))
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		@bug=Bug.find(params[:id])
		if @bug.update(params_bug)
			flash[:success] ="Bug status updated successfully"
			redirect_to project_bug_path(Project.find(params[:project_id]),@bug)
		else
			render 'edit'
		end		
	end

	def delete
		
	end

	def index
		@bugs  = Bug.all
	end

	def show
		
	end

	private

	def params_bug
		params.require(:bug).permit(:title, :ty,:status)
	end

	def require_same_user
		@pro = Project.find(params[:project_id])

		if !current_user.projects.exists?(@pro)
			flash[:danger] = "your can only access your own records"
		end
	end

end