class CompaniesController < InheritedResources::Base

  def create
    company = Company.new(company_params)
    if company.save
      redirect_to companies_path
    else
      redirect_to new_companies_path
    end
  end

  def edit
    company = Company.find(params[:id])
    render json: company
  end

  def update
    company = Company.find(params[:id])
    if company.update_attributes(company_params)
      redirect_to companies_path
    end
  end

  def index
    @companies = Company.all.order('created_at')
  end

  private

    def company_params
      params.permit(:company_name, :ein, :fiscal_year_end, :entity_type, :naic_code, :payroll_provider, :payroll_frequency)
    end

end
