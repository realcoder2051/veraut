class BusinessesController < InheritedResources::Base

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
    @businesses = Business.all.order('created_at').where(task_id: session[:task_id])
  end

  def create
    @business = Business.new(business_params)
    @business[:task_id] = session[:task_id]
    @business[:does_company_have_employees] = company_have_employees?
    if @business.save
      redirect_to businesses_path
    else
      render :new
    end
  end

  private

    def business_params
      params.require(:business).permit(:name, :ein, :date_purchased_or_sold, :address, :city, :state, :zip, :phone, :qualified_plan_sponsored, :entity_type)
    end

    def company_have_employees?
      have_employees = params[:business][:does_company_have_employees]
      if have_employees == "No"
        return false
      else
        return true
      end
    end

end
