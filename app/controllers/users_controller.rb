class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  	  flash[:notice] = "You have signed up successfully."
  	  redirect_to projects_path
  	else
  	  render :new
  	end
  end

  def show
  end
  
  def update
  	if @user.update(user_params)
  		flash[:notice] = "Profile has been updated."
  		redirect_to @user
  	else
  		flash[:alert] = "Profile has not been updated."
  		render "edit"
  	end
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

	  def user_params
		  params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
	  end
end
