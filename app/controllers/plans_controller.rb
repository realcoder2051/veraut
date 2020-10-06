class PlansController < InheritedResources::Base

  def new
    @plan = Plan.new
  end

  def create
    plan = Plan.new(plan_params)
    plan[:task_id] = session[:task_id]
    if plan.save
        redirect_to plans_path
    else
      redirect_to new_plan_path
    end
  end

  def edit
		@plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    if plan.update_attributes(plan_params)
      redirect_to plans_path
    end
  end

  def index
    @plans = Plan.all.order('created_at').where(task_id: session[:task_id])
  end

  private

    def plan_params
      params.require(:plan).permit(:question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :question11, :question12)
    end

end
