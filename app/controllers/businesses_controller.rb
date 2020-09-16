class BusinessesController < InheritedResources::Base

  def edit
    render json: Business.find(params[:id]),:layout => false
  end

  def update
    business = Business.find(params[:id])
    if business.update_attributes(business_params)
      redirect_to businesses_path
    end
  end

  def create
    business = Business.new(business_params)
    if business.save
      redirect_to businesses_path
    else
      redirect_to new_businenss_path
    end
  end

  private

    def business_params
      params.permit(:name, :ein, :date_purchased_or_sold, :address, :city, :state, :zip, :phone, :does_company_have_employees, :qualified_plan_sponsored, :entity_type)
    end

end
