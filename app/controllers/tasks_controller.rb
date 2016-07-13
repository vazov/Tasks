class TasksController < ApplicationController
  load_and_authorize_resource
  before_action :set_project, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = @project.tasks.build
  end

  def show
    @comment = Comment.new
    @comments = @task.comments
  end

  def create
    @task = @project.tasks.build(task_params)
    current_user.tasks << @task
    if @task.save
      flash[:notice] = "Task has been created."
      redirect_to @project
    else
      flash[:alert] = "Task has not been created."
      render "new"
    end
  end
  
  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task has been updated."
      redirect_to [@project, @task]
    else
      flash[:alert] = "Task has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task has been deleted."
    redirect_to @project
  end
  
  private
    def task_params
      params.require(:task).permit(:id, :title, :content, 
        :status, :start_date, :due_date, :estimation )
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end
end
