class ProjectTasksController < InheritedResources::Base

  private

    def project_task_params
      params.require(:project_task).permit(:task_id, :company_contact, :company_data, :principals, :family_relationship, :other_companies_owned, :contacts, :plan_compilance_question, :other_compilance_question, :employee_census, :final_approval)
    end

end
