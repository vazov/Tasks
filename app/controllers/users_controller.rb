class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show]

  def show
  end

  def my_tasks
    my_projects
  end

  def my_projects
    @projects ||=[]
    my_teams.map {|team| team.projects.map {|project| @projects << project }}
  end
  
  def my_teams
    @teams = current_user.teams
  end
  
  def join
    team = Team.find(params[:team_id])
    if team.users << current_user
      flash[:notice] = "Succesfully join to team"
      redirect_to team_path(params[:team_id])
    else
      flash[:alert] = "Team has not been updated."
      redirect_to team_path(params[:team_id])
    end
  end

  def unjoin
    team = Team.find(params[:team_id])
    if team.users.delete(current_user)
      flash[:notice] = "Succesfully unjoin from team"
      redirect_to team_path(params[:team_id])
    else
      flash[:alert] = "Team has not been updated."
      redirect_to team_path(params[:team_id])
    end
  end

  private
	  def set_user
		  @user = User.find(params[:id])
	  end
end
