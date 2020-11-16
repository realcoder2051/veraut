class ApplicationController < ActionController::Base


  protect_from_forgery with: :null_session
  before_action :authenticate_user!,except: :internal_dashboard
  layout 'stack/application'

  private

  rescue_from CanCan::AccessDenied do |exception|
   # render 'shared/flash'
    flash[:error] =  'It seems you do not have permission to view this page'
    format.html { redirect_to root_url}
    respond_to do |format|
      #format.html { redirect_to root_url }
      format.html { redirect_to root_url}
    end
	end


  protected
  def after_sign_in_path_for(_)
    root_path
  end

  def after_sign_out_path_for(_)
    root_path
  end

  def stepper
    if session[:task_id].present?
      task = Task.find(session[:task_id])
      @steppers={}
      @steppers[:general] = task[:steppers]["general"]
      @steppers[:company] = task[:steppers]["company"]
      @steppers[:principal] = task[:steppers]["principal"]
      @steppers[:family] = task[:steppers]["family"]
      @steppers[:business] = task[:steppers]["business"]
      @steppers[:contact] = task[:steppers]["contact"]
      @steppers[:plan] = task[:steppers]["plan"]
      @steppers[:fifty_five_hundred] = task[:steppers]["5500"]
      @steppers[:employee] = task[:steppers]["employee"]
    else
      redirect_to tasks_path
    end
  end

end
