class EmployeesController < InheritedResources::Base
	before_action :fetch_employee, only: %i[index]
	before_action :stepper, only: %i[index]
  before_action :find_employee , only: [:edit,:update,:destroy]
  before_action :find_task,only: %i[create update save_employee import_store bulk_delete destroy]

  def find_task
    @task = Task.find(session[:task_id])
  end

  def bulk_delete
    employees =  params[:employee_ids]
    status = Employee.where(id: employees).update(active: true)
    @task.steppers["employee"] = false
    @task.save
    redirect_to employees_path
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def edit
  end

  def update
    if @employee.update_attributes(employee_params)
      @task.steppers["employee"] = false
      @task.save
      redirect_to employees_path
    else
      render :edit
    end
  end

  def save_employee
    employees = Employee.where("active = ? AND task_id=?",false, session[:task_id])
    status = true
    employees.each do |employee|
      if employee.first_name=="" || employee.last_name=="" || !(employee.ssn.to_s.length<=9) || employee.hours=="" || employee.compensation=="" || employee&.date_of_birth=="" || employee&.original_date_of_hire==""
        status = false
      else
        if employee.is_completed == false
          employee.update(is_completed: true)
        end
      end
    end
    if status && employees.length>0
      @task.steppers["employee"] =  true
      @task.save
      redirect_to approvals_path
    elsif employees.length == 0
      flash[:alert] = "It is required to provide at least one employee record before the Step can be completed."
      @task.steppers["employee"] =  false
      @task.save
      redirect_to employees_path
    else
      @task.steppers["employee"] =  false
      @task.save
      redirect_to employees_path
    end
  end

  def index
    @employee = Employee.new
		@notes = Note.all
    ransack_search = params[:q]
    @first_name = ransack_search[:last_name_or_first_name_cont] if ransack_search.present?
    respond_to do |format|
      format.xlsx
      format.html { render :index }
    end
  end

  def create
    @employee = Employee.new(employee_params)
    @employee[:task_id] = session[:task_id]
    if @employee.save
      @task.steppers["employee"] =  false
      @task.save
      redirect_to employees_path
    else
      render :new
    end

  end

  def import_store
    file = params[:file]
    file_type = file.present? ? file.path.split('.').last.to_s.downcase : ''
    if file.present? and (file_type == 'csv' or file_type == 'xlsx')
      if (Employee.update_imported_store(file,session[:task_id]))
        flash[:notice] = "File Uploaded Successfully"
        @task.steppers["employee"] =  false
        @task.save
	  		redirect_to employees_path
      else
				flash[:alert] = "Wrong file format"
				redirect_to employees_path
			end
    else
      flash[:alert] = "File format not supported except xlxs or csv"
      redirect_to employees_path
    end
  end

  def destroy
    if @employee.update_attribute(:active, true)
      @task.steppers["employee"] = false
			@task.save
      redirect_to employees_path
    end
  end

  def show

  end

  private
  def fetch_employee
    @q = Employee.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'first_name asc' if @q.sorts.empty?
     end
    @employees = result.paginate(:page => params[:page], per_page:20).order('status ASC').where("task_id = ? and active = ?", session[:task_id],false)
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :ssn, :gender, :date_of_birth, :original_date_of_hire, :date_of_termination, :date_of_retire, :compensation, :hours, :pre_tax_salary_deferal, :roth_salary_deferal, :employee_match, :company_division, :union_employee, :status)
  end

end
