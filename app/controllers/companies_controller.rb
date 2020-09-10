class CompaniesController < InheritedResources::Base

  private

    def company_params
      params.require(:company).permit(:company_name, :ein, :fiscal_year_end, :entity_type, :naic_code, :payroll_provider, :payroll_frequency)
    end

end
