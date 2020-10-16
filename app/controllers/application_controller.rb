class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  before_action :authenticate_user!,except: :internal_dashboard
  layout 'stack/application'


  private
  rescue_from CanCan::AccessDenied do |exception|
   # render 'shared/flash'
    flash[:error] =  'It seems you do not have permission to view this page'
    respond_to do |format|
      #format.html { redirect_to root_url }
      format.html { redirect_to root_url}
    end
	end
	
	def stepper
		@company_stepper =  Company.find_by(user_id: current_user.id)
		@address = Address.find_by(user_id: current_user.id)
		@contact_number = ContactNumber.find_by(user_id: current_user.id)
		@principal = Principal.find_by(user_id: current_user.id)
		@business = Business.find_by(user_id: current_user.id)
		@family =  Family.find_by(user_id: current_user.id)	
		@contact =  Contact.find_by(task_id: session[:task_id])
		@plan_stepper = QuestionaireAnswer.find_by task_id: session[:task_id], question_type_id: 1
		@fifty_five_hundred_stepper = QuestionaireAnswer.find_by task_id: session[:task_id], question_type_id: 2
		@employee =  Employee.find_by(task_id: session[:task_id])
	end


  protected
  def after_sign_in_path_for(_)
    root_path
  end

  def after_sign_out_path_for(_)
    root_path
  end

end
