class CompaniesController < InheritedResources::Base


  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    company.update(task_id: session[:task_id])
    if company.save
      redirect_to companies_path
    else
      redirect_to new_companies_path
    end
  end

  def index
		@companies = Company.all.order('created_at').where(task_id: session[:task_id])
		@notes = Note.all
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    if company.update_attributes(company_params)
      redirect_to companies_path
    end
	end


	
	def create_note
		@note = Note.new
		@note[:description] = params[:des]
		@note[:data_collection_step] = request.original_fullpath[1,7]
		puts current_user.email
		@note[:created_by] = current_user.email
		if @note.save
			render json: {
					html: render_to_string(partial: '/notes/note.html.erb', locals: { note: @note })
			}
		end
	end

	# def delete_note
	# 	note = Note.find(params[:id])
	# 	note.destroy
	# 	redirect_to companies_path
	# end

	private

	def note_params
		params.permit(:description)
	end
	
	def company_params
		params.require(:company).permit(:company_name, :ein, :fiscal_year_end, :entity_type, :naic_code, :payroll_provider, :payroll_frequency)
	end

end
