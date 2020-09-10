class BusinessesController < InheritedResources::Base

  private

    def business_params
      params.require(:business).permit(:name, :ein, :date_purchased_or_sold, :address, :city, :state, :zip, :phone, :does_company_have_employees, :qualified_plan_sponsored, :entity_type)
    end

end
