class FiftyFiveHundredsController < InheritedResources::Base

  def new
  end

  def create
    fifty_five_hundred = FiftyFiveHundred.new(fifty_five_hundred_params)
    if fifty_five_hundred.save
        redirect_to fifty_five_hundreds_path
    else
      redirect_to new_fifty_five_hundred_path
    end
  end

  def update
    fifty_five_hundred = FiftyFiveHundred.find(params[:id])
    if fifty_five_hundred.update_attributes(fifty_five_hundred_params)
      redirect_to fifty_five_hundreds_path
    end
  end

  private

    def fifty_five_hundred_params
      params.permit(:question1, :question2, :question3, :question4, :question5, :question6)
    end

end
