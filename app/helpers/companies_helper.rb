module CompaniesHelper

  def get_date
    @company[:fiscal_year_end].strftime("%d") if @company[:fiscal_year_end].present?
  end

  def get_month
    @company[:fiscal_year_end].strftime("%m") if @company[:fiscal_year_end].present?
  end

  def company_already_exist?
   count = Company.where(task_id: session[:task_id],user_id: current_user.id).count
    if count>0
      return true
    else
      return false
    end
  end

  def get_company
    Company.where(task_id: session[:task_id],user_id: current_user.id).ids.first if  Company.where(task_id: session[:task_id],user_id: current_user.id).present?
  end

end
