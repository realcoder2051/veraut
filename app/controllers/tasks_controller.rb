class TasksController < InheritedResources::Base

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.update(task_group_id: current_user.task_group.id)
    if task.save
      redirect_to tasks_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update_attributes(task_params)
      redirect_to tasks_path
    end
  end

  def start_data_collection_process
    redirect_to generals_path
  end

  def index
    @tasks = Task.all.where(task_group_id: current_user.task_group.id)
  end

  private

    def task_params
      params.require(:task).permit(:task_name)
    end

end
