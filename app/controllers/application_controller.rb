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
    @steppers[:address] = Address.where(task_id: session[:task_id],active: true)&.pluck("is_completed")
    @steppers[:contact_number] = ContactNumber.where(task_id: session[:task_id],active: false)&.pluck("is_completed")
    @steppers[:company] = Company.where(task_id: session[:task_id])&.pluck("is_completed")
    @steppers[:principal] = [calculate_ownership?]
    @steppers[:family] = Family.where(task_id: session[:task_id],active: false)&.pluck("is_completed")
    @steppers[:business] = Business.where(task_id: session[:task_id],active: false)&.pluck("is_completed")
    @steppers[:contact] = Contact.find_by(task_id: session[:task_id])&.is_completed
    plan = QuestionaireAnswer.where(task_id: session[:task_id], question_type_id: 1)&.pluck("is_completed")
    @steppers[:plan] = [plan.present? && !plan.include?(false)]
    fifty_five_hundred = QuestionaireAnswer.where(task_id: session[:task_id], question_type_id: 2)&.pluck("is_completed")
    @steppers[:fifty_five_hundred] = [fifty_five_hundred.present? && !fifty_five_hundred.include?(false)]
    @steppers[:employee] = Employee.find_by(task_id: session[:task_id])&.is_completed
    @steppers[:general] = @steppers[:address] && @steppers[:contact_number]
  end

  protected
  def after_sign_in_path_for(_)
    root_path
  end

  def after_sign_out_path_for(_)
    root_path
  end

  def calculate_ownership?
    principals = Principal.where(task_id: session[:task_id],active: false)
    if principals&.pluck("is_completed").include?(true)
      sum = principals.pluck("ownership").inject(0){|sum,x| sum + x }
      if sum >=100
        return true
      else
        return false
      end
    else
      return false
    end
  end

end
