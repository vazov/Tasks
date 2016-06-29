class ProjectsController < ApplicationController
  def index
    #@projects = Project.for(current_user)
  end

  def new
    @project = Project.new
  end
  
  def show
    @project = Project.find(params[:id])
  end

  def create
  	@project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      #flash[:alert] = "Project has not been created."
      #render "new"
    end
  end

  private
    def project_params
  	  params.require(:project).permit(:name, :summary, :start_date, :end_date)
    end
end
