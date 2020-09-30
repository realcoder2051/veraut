class FiftyFiveHundredsController < InheritedResources::Base

  def new
    @fifty_five_hundred = FiftyFiveHundred.new
    end

  def create
    fifty_five_hundred = FiftyFiveHundred.new(fifty_five_hundred_params)
    fifty_five_hundred.update(task_id: session[:task_id])
    if fifty_five_hundred.save
        redirect_to fifty_5500_path
    else
      redirect_to fifty_5500_new_path
    end
  end

  def edit 
    @fifty_five_hundred = FiftyFiveHundred.find(params[:id])
  end

  def update
    fifty_five_hundred = FiftyFiveHundred.find(params[:id])
    if fifty_five_hundred.update_attributes(fifty_five_hundred_params)
      redirect_to fifty_5500_path
    end
  end

  def index
    @fifty_five_hundreds = FiftyFiveHundred.all.order('created_at').where(task_id: session[:task_id])
  end

  def destroy
    fifty_five_hundred = FiftyFiveHundred.find(params[:id])
    if fifty_five_hundred.destroy
      redirect_to fifty_5500_url
    end
  end

  private

    def fifty_five_hundred_params
      params.require(:fifty_five_hundred).permit(:question1, :question2, :question3, :question4, :question5, :question6)
    end

end
