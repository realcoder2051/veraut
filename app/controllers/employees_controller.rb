class EmployeesController < InheritedResources::Base

  def edit
    render json: Employee.find(params[:id]),:layout => false
  end

  def update
    employee = Employee.find(params[:id])
    if employee.update_attributes(employee_params)
      redirect_to employees_path
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

  private

    def employee_params
      params.permit(:first_name, :last_name, :ssn, :gender, :date_of_birth, :original_date_of_hire, :date_of_termination, :date_of_retire, :compensation, :hours, :pre_tax_salary_deferal, :roth_salary_deferal, :employee_match, :company_division, :union_employee)
    end

end
