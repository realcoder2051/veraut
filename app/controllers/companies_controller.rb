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
		if @company.save
			redirect_to edit_company_path(Company.last.id)
		else
			stepper
			render :new
		end
  end

  def index
		@companies = Company.all.order('created_at').where(user_id: current_user.id)
  end

	def edit
		@notes = Note.all
    @company = Company.find(params[:id])
  end

	def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
			redirect_to principals_path
		else
			stepper
      render :edit
		end
	end

	def is_completed
		company = Company.where("is_completed=? AND user_id=? AND task_id=?", false , current_user.id , session[:task_id])
		company.update(is_completed: true)
		redirect_to principals_path
	end

	private

	def note_params
		params.permit(:description)
	end
	
	def company_params
		params.require(:company).permit(:company_name, :ein, :fiscal_year_end, :entity_type, :naic_code, :payroll_provider, :payroll_frequency)
	end

end
