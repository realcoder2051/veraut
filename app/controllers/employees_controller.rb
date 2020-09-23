class EmployeesController < InheritedResources::Base
  before_action :fetch_employee, only: %i[index]


  def edit
    employee = Employee.find(params[:id])
    render json: employee
  end

  def update
    employee = Employee.find(params[:id])
    if employee.update_attributes(employee_params)
      redirect_to employees_path
    end
  end

  def save_employee
    Employee.where("status=?", 0).update("status":1)
    redirect_to employees_path
  end

  def bulk_delete
    puts "delete"
    data = Employee.where("status=?", 0).destroy_all if Employee.exists?
    redirect_to employees_path
  end

  def index
    ransack_search = params[:q]
    @first_name = ransack_search[:first_name_cont] if ransack_search.present?    
    respond_to do |format|
      format.xlsx 
      format.html { render :index }
    end
  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      redirect_to employees_path
    else
      redirect_to new_employee_path
    end
  end

  def import_store
    file = params[:file]
    file_type = file.present? ? file.path.split('.').last.to_s.downcase : ''
    if file.present? and (file_type == 'csv' or file_type == 'xlsx')
      Employee.update_imported_store(file)
      redirect_to employees_path
    else
      redirect_to employees_path, flash: {danger: 'csvかxlsxファイルをアップロードしてください。'} 
    end
  end

  private
  def fetch_employee
    @q = Employee.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'first_name asc' if @q.sorts.empty?
     end
    @employees = result.paginate(:page => params[:page], per_page:10).order('status ASC')
  end

  def employee_params
    params.permit(:first_name, :last_name, :ssn, :gender, :date_of_birth, :original_date_of_hire, :date_of_termination, :date_of_retire, :compensation, :hours, :pre_tax_salary_deferal, :roth_salary_deferal, :employee_match, :company_division, :union_employee, :status)
  end

end
