module SessionsHelper

  # Logs in the given user. 
  def logged_in?
    !current_user.nil?
  end
end
