class CompaniesController < InheritedResources::Base
	before_action :stepper, only: %i[new edit ]

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
		if @company.entity_type== "" || @company.payroll_frequency=="" || @company.fiscal_year_end == "" || @company.ein<3 || @company.ein >9
			session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
		end
		if @company.save
			redirect_to edit_company_path(@company)
		else
			stepper
			render :new
		end
  end

  def index
		@companies = Company.where("user_id = ?", current_user.id)
  end

	def edit
		@notes = Note.all
    @company = Company.find(params[:id])
  end

	def update
		@company = Company.find(params[:id])
		if params[:company][:entity_type] == "" || params[:company][:payroll_frequency]=="" || params[:company][:fiscal_year_end] == "" || params[:company][:ein].length <3 || params[:company][:ein].length>9
			session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
		end
		if @company.update_attributes(company_params)
			redirect_to edit_company_path(@company)
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

end
