class Admin::AssignmentsController < Admin::BaseController
  def index
  end

  def new
  	@assignment = Assignment.new
  end

  def create
  	@assignment = Assignment.new(assignment_params)

  	respond_to do |format|
      if @assignment.save
        format.html { redirect_to new_admin_assignment_path, notice: 'Assignment was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def assignment_params
      params.require(:assignment).permit(:team_id, :project_id)
    end
end
