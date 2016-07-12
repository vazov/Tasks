class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end
  
  def show
    @team = Team.find(params[:id])
    @member = current_user.teams.exists?(@team.id)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = "Team has been created."
      redirect_to @team
    else
      flash[:alert] = "Team has not been created."
      render "new"
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:notice] = "Team has been updated."
      redirect_to @team
    else
      flash[:alert] = "Team has not been updated."
      render "edit"
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:notice] = "Team has been destroyed."
    redirect_to projects_path
  end

  def remove_project
    team = Team.find(params[:id])
    project = Project.find(params[:project_id])
    if team.projects.delete(project)
      flash[:notice] = "Project has been removed from team"
      redirect_to team
    else
      flash[:alert] = "Team has not been updated."
      redirect_to team
    end
  end
  

  private
  def team_params
  	  params.require(:team).permit(:name)
    end

    def set_team
      @team = Team.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The team you were looking for could not be found."
        redirect_to teams_path
    end
end
