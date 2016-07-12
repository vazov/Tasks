class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected
    def configure_permitted_parameters 
      devise_parameter_sanitizer.for(:sign_up)        << :first_name
      devise_parameter_sanitizer.for(:account_update) << :first_name
      devise_parameter_sanitizer.for(:sign_up)        << :last_name
      devise_parameter_sanitizer.for(:account_update) << :last_name
    end

  private
    def set_project
      @project = Project.find(params[:project_id])
      # rescue ActiveRecord::RecordNotFound
      #   flash[:alert] = "The project you were looking for could not be found."
      #   redirect_to projects_path
    end
    helper_method :set_project 
end
