class BusinessesController < InheritedResources::Base
	before_action :stepper, only: %i[index]
	before_action :fetch_business, only: %i[index]
	before_action :find_business,only: [:edit,:update,:destroy]

	def find_business
		@business = Business.find(params[:id])
	end

  def new
    @business = Business.new
	end

  def edit
	end

	def update
		if params[:business][:name] == "" || (params[:business][:ein].length >=2 && params[:business][:ein].length <=9) == false || params[:business][:does_company_have_employees] == "" || params[:business][:qualified_plan_sponsored] == "" || params[:business][:entity_type] == ""
			if (params[:business][:ein].to_s.length>=2 && params[:business][:ein] .to_s.length <=9) == false
				session[:error] = "EIN must be 9 characters but your choices have been saved, however the step can not be completed because there are additional required fields."
				#params[:business][:ein] = ""
			else
				session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
			end
			@business.is_completed = false
		end
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
		if @business.name == "" || (@business.ein.to_s.length>=2 && @business.ein.to_s.length <=9) == false || @business.qualified_plan_sponsored == "" || @business.entity_type == "" || @business.does_company_have_employees == ""
			if (@business.ein.to_s.length>=2 && @business.ein.to_s.length <=9 ) == false
				session[:error] = "EIN must be 9 characters but your choices have been saved, however the step can not be completed because there are additional required fields."
				#@business.ein=""
			else
				session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
			end
		end

		if @business.save
			redirect_to businesses_path
		else
			render :new
		end
	end

	def is_completed
		businesses = Business.where("is_completed=? AND user_id=? AND task_id=? AND active = ?", false , current_user.id , session[:task_id],false)
		businesses.each do |business|
			if business.name == "" || (business.ein.to_s.length >= 2 && business.ein.to_s.length<=9) == false || business.does_company_have_employees == "" || business.qualified_plan_sponsored == "" || business.entity_type == ""
			else
				business.update(is_completed: true)
			end
		end
		redirect_to contacts_path
	end

	def destroy
		if @business.update_attribute(:active, true)
			redirect_to businesses_path
		end
  end

	private

	def fetch_business
    @q = Business.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @businesses = result.paginate(:page => params[:page], per_page:10).order('created_at').where("task_id = ? and active =?", session[:task_id],false)
  end

	def business_params
		params.require(:business).permit(:name, :ein, :date_purchased_or_sold, :address, :city, :state, :zip, :phone,:does_company_have_employees, :qualified_plan_sponsored, :entity_type)
	end

end
