class PlansController < InheritedResources::Base

  def new
    @plans = Plan.new
    @plans = [
    "1. Were any contribution transmitted to plan later than 7 business days after the payroll date (ERISA Regulation 2510.3-102",
    "2.Were there any formal plan participants that returned to work during this plan year? If yes please provide there detail original name ,original date of hire ,date of termination and date of retirement in censum form",
    "3.Has the employer utilized the services of any leased or contract employee?",
    "4. Will a request for extension",
    "5.Were there any formal plan participants that returned to work during this plan year? If yes please provide there detail original name ,original date of hire ,date of termination and date of retirement in censum form",
    "6.Has the employer utilized the services of any leased or contract employee?",
    "7. Were any contribution transmitted to plan later than 7 business days after the payroll date (ERISA Regulation 2510.3-102",
    "8.Were there any formal plan participants that returned to work during this plan year? If yes please provide there detail original name ,original date of hire ,date of termination and date of retirement in censum form",
    "9.Has the employer utilized the services of any leased or contract employee?",
    "10. Were any contribution transmitted to plan later than 7 business days after the payroll date (ERISA Regulation 2510.3-102",
    "11.Were there any formal plan participants that returned to work during this plan year? If yes please provide there detail original name ,original date of hire ,date of termination and date of retirement in censum form",
    "12.Were there any formal plan participants that returned to work during this plan year? If yes please provide there detail original name ,original date of hire ,date of termination and date of r"
  ]
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
        redirect_to plans_path
    else
      redirect_to new_plan_path
    end
  end

  private

    def plan_params
      params.permit(:question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :question11, :question12)
    end

end
