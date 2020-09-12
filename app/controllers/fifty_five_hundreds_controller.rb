class FiftyFiveHundredsController < InheritedResources::Base

  def new
    @fifty_five_hundreds = FiftyFiveHundred.new
    @fifty_five_hundreds = [
    "1. Were any contribution transmitted to plan later than 7 business days after the payroll date (ERISA Regulation 2510.3-102",
    "2.Were there any formal plan participants that returned to work during this plan year? If yes please provide there detail original name ,original date of hire ,date of termination and date of retirement in censum form",
    "3.Has the employer utilized the services of any leased or contract employee?",
    "4. Will a request for extension",
    "5.Were there any formal plan participants that returned to work during this plan year? If yes please provide there detail original name ,original date of hire ,date of termination and date of retirement in censum form",
    "6.Has the employer utilized the services of any leased or contract employee?"
  ]
  end

  def create
    @fifty_five_hundred = FiftyFiveHundred.new(fifty_five_hundred_params)
    if @fifty_five_hundred.save
        redirect_to fifty_five_hundreds_path
    else
      redirect_to new_fifty_five_hundred_path
    end
  end

  private
    def fifty_five_hundred_params
      params.permit(:question1, :question2, :question3, :question4, :question5, :question6)
    end

end
