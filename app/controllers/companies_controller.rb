class CompaniesController < InheritedResources::Base
	before_action :stepper, only: %i[new edit]
	before_action :find_task,only: [:create,:update]

	def find_task
		@task = Task.find(session[:task_id])
	end

	def new
		@company = Company.new
		@notes = Note.all
		if Company.exists?(task_id: session[:task_id], user_id: current_user.id)
			@company = Company.find_by(task_id: session[:task_id])
			render :edit
		end
  end

  def create
		@company = Company.new(company_params)
		errors = ""
		errors += Company.company_name_exist(@company["company_name"])
		errors += Company.ein_valid(@company["ein"])
		errors += Company.fiscal_year_end_exist(@company["fiscal_year_end"])
		errors += Company.entity_type_exist(@company["entity_type"])
    errors += Company.payroll_frequency_exist(@company["payroll_frequency"])
		@company[:task_id] = session[:task_id]
		@company[:user_id] = current_user.id
		@company.is_completed = true
		@task.steppers["company"] = true
		if errors.present?
			flash[:alert] = "Your choices have been saved, however the step can not be completed because there are additional required fields."+errors
			@company.is_completed = false
			@task.steppers["company"] = false
		end
			@task.save
		if @company.save
			redirecting_request
		else
			stepper
			render :new
		end
  end

  def index
		@companies = Company.where("task_id = ?", session[:task_id])
  end

	def edit
		@notes = Note.all
    @company = Company.find(params[:id])
  end

	def update
		@company = Company.find(params[:id])
		company = company_params
		errors = ""
		errors += Company.company_name_exist(company["company_name"])
		errors += Company.ein_valid(company["ein"])
		errors += Company.fiscal_year_end_exist(company["fiscal_year_end"])
		errors += Company.entity_type_exist(company["entity_type"])
		errors += Company.payroll_frequency_exist(company["payroll_frequency"])
	  errors.present? ? flash[:alert] = "Your choices have been saved, however the step can not be completed because there are additional required fields."+errors : ""
		@company.is_completed = true
		flag = true
		if errors.present?
			@company.is_completed = false
			@task.steppers["company"]= false
			flag = false
			@task.save
		end
		if @company.update_attributes(company)
			if @company.fiscal_year_end.present? == false
				@task.steppers["company"]= false
				@task.save
				@company.update(is_completed: false)
				flag = false
				errors.present?  ? "": errors+= "Fiscal Year end can't be blank"
				errors.present? ? flash[:alert] = "Your choices have been saved, however the step can not be completed because there are additional required fields."+errors: ""
				redirecting_request
			else
				flag ? @task.steppers["company"]=true : @task.steppers["company"]=false
				@task.save
				redirecting_request
			end
		else
			stepper
			render :edit
		end
	end

	private

	def note_params
		params.permit(:description)
	end

	def company_params
		params.require(:company).permit(:company_name, :ein, :fiscal_year_end, :entity_type, :naic_code, :payroll_provider, :payroll_frequency)
	end

	def redirecting_request
		if @company.is_completed == true
			redirect_to principals_path
		else
			redirect_to edit_company_path(@company)
		end
	end

end
