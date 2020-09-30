class TaskGroupsController < InheritedResources::Base

  private

    def task_group_params
      params.require(:task_group).permit()
    end

end
