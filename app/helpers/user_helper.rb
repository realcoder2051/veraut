module UserHelper

  # def logged_in?
  #   !!current_user  #it will return true or false
  # end

  # def require_user
  #   if !logged_in?
  #       flash[:alert] = "You must be logged in"
  #       redirect_to login_path
  #   end
  # end

  def resource_available
    @resource.role[:name] if @resource.role.present?
  end
end