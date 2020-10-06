module BuisenessesHelper
  def company_have_employees
    if @business[:does_company_have_employees] == false
      return "No"
    else
      return "Yes"
    end
  end

end
