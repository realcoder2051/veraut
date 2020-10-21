class EmployeesController < InheritedResources::Base
	before_action :fetch_employee, only: %i[index]
	before_action :stepper, only: %i[index]


  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(employee_params)
      redirect_to employees_path
		else
			render :edit
		end
  end

  def save_employee
    Employee.where("status=?", 0).update("status":1)
    redirect_to employees_path
  end

  def bulk_delete
    puts "delete"
    data = Employee.where("task_id=?", session[:task_id]).destroy_all if Employee.exists?
    redirect_to employees_path
	end
	


	def index
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
      redirect_to employees_path
		else
			flash.now[:alert] = "Wrong file format"
      render :new
    end
  end

  def import_store
    file = params[:file]
    file_type = file.present? ? file.path.split('.').last.to_s.downcase : ''
    if file.present? and (file_type == 'csv' or file_type == 'xlsx')
			if (Employee.update_imported_store(file,session[:task_id]))
			flash[:notice] = "File Uploaded Successfully"
			redirect_to employees_path
			else
				flash[:alert] = "Wrong file format"
				redirect_to employees_path
			end
    else
      redirect_to employees_path
    end
  end

  private
  def fetch_employee
    @q = Employee.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'first_name asc' if @q.sorts.empty?
     end
    @employees = result.paginate(:page => params[:page], per_page:10).order('status ASC').where(task_id: session[:task_id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :ssn, :gender, :date_of_birth, :original_date_of_hire, :date_of_termination, :date_of_retire, :compensation, :hours, :pre_tax_salary_deferal, :roth_salary_deferal, :employee_match, :company_division, :union_employee, :status)
  end

end
