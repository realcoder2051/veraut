class TaskItemsController < InheritedResources::Base

  def index
    @q= TaskItem.all.paginate(:page => params[:page], per_page:10).ransack(params[:q])
    @task_items = @q.result
    @project_tasks = ProjectTask.all.order('created_at ASC')
  end

  def complete
  end

  private

    def task_item_params
      params.require(:task_item).permit(:task_id, :company_contact, :company_data, :principals, :family_relationship, :other_companies_owned, :contacts, :plan_compilance_question, :other_compilance_question, :employee_census, :final_approval)
    end

end
