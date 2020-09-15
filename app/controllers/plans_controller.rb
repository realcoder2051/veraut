class PlansController < InheritedResources::Base

  def new
  end

  def create
    plan = Plan.new(plan_params)
    if plan.save
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
