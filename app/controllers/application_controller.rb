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
    @steppers = {}
    @steppers[:address] = Address.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:contact_number] = ContactNumber.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:company] = Company.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:principal] = Principal.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:family] = Family.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:business] = Business.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:contact] = Contact.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:plan] = QuestionaireAnswer.find_by(task_id: session[:task_id], question_type_id: 1)&.is_completed
    @steppers[:fifty_five_hundred] = QuestionaireAnswer.find_by(task_id: session[:task_id], question_type_id: 2)&.is_completed
    @steppers[:employee] = Employee.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:general] = @steppers[:address] && @steppers[:contact_number]
		# @company_stepper =  Company.find_by(task_id: session[:task_id]).is_completed
		# @address_helper = Address.find_by(task_id: session[:task_id])
		# @contact_number_helper = ContactNumber.find_by(task_id: session[:task_id])
		# @principal_stepper = Principal.find_by(task_id: session[:task_id])
		# @business_stepper = Business.find_by(task_id: session[:task_id])
		# @family_stepper =  Family.find_by(task_id: session[:task_id])
		# @contact =  Contact.find_by(task_id: session[:task_id])
		# @plan_stepper = QuestionaireAnswer.find_by task_id: session[:task_id], question_type_id: 1
		# @fifty_five_hundred_stepper = QuestionaireAnswer.find_by(task_id: session[:task_id], question_type_id: 2)
		# @employee =  Employee.find_by(task_id: session[:task_id])
	end


  protected
  def after_sign_in_path_for(_)
    root_path
  end

  def after_sign_out_path_for(_)
    root_path
  end

end
