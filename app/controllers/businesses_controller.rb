class BusinessesController < InheritedResources::Base
	before_action :stepper, only: %i[index]
	before_action :fetch_business, only: %i[index]

  def new
    @business = Business.new
  end
  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    @business[:does_company_have_employees] = company_have_employees?
    if @business.update_attributes(business_params)
			redirect_to businesses_path
		else
			render :edit
    end
  end

	def index
		ransack_search = params[:q]
		@notes = Note.all
  end

  def create
    @business = Business.new(business_params)
		@business[:task_id] = session[:task_id]
		@business[:user_id] = current_user.id
    if @business.save
      redirect_to businesses_path
    else
      render :new
    end
	end
	
	def is_completed
		business = Business.where("is_completed=? AND user_id=? AND task_id=?", false , current_user.id , session[:task_id])
		business.update(is_completed: true)
		redirect_to contacts_path
	end

	private
	
	def fetch_business
    @q = Business.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @businesses = result.paginate(:page => params[:page], per_page:10).order('created_at').where(user_id: current_user.id)
  end

	def business_params
		params.require(:business).permit(:name, :ein, :date_purchased_or_sold, :address, :city, :state, :zip, :phone,:does_company_have_employees, :qualified_plan_sponsored, :entity_type)
	end

	# def company_have_employees?
	# 	have_employees = params[:business][:does_company_have_employees]
	# 	if have_employees == "No"
	# 		return false
	# 	else
	# 		return true
	# 	end
	# end

end
