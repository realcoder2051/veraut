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
		@company[:task_id] = session[:task_id]
		@company[:user_id] = current_user.id
		@company.is_completed = true
		if @company.company_name == "" || @company.entity_type== "" || @company.payroll_frequency=="" || @company.fiscal_year_end == "" || @company.ein.length!=9
			if @company.ein.length!=9
				session[:error] = "EIN must be 9 characters but your choices have been saved, however the step can not be completed because there are additional required fields."
			else
				session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
			end
			@task.steppers["company"] = false
			@task.save
			@company.is_completed = false
		end
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
		@company.is_completed = true
		if params[:company][:company_name] == "" || params[:company][:entity_type] == "" || params[:company][:payroll_frequency]=="" || params[:company][:fiscal_year_end] == "" || params[:company][:ein].length !=9
			if params[:company][:ein].length !=9
				session[:error] = "EIN must be 9 characters but your choices have been saved, however the step can not be completed because there are additional required fields."
			else
				session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
			end
			@task.steppers["company"]= false
			@task.save
			@company.is_completed = false
		end
		if @company.update_attributes(company_params)
			if !(session[:error].present?)
				@task.steppers["company"]= true
				@task.save
			end
			redirecting_request
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
