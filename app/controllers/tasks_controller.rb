class TasksController < InheritedResources::Base
  load_and_authorize_resource

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

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      if session[:task_id] == task.id
        session[:task_id] = nil
        redirect_to tasks_path
      else
        redirect_to tasks_path
      end
    end
  end

  def close_task
    session[:task_id] = nil
    session[:error] = nil
    redirect_to tasks_path
  end

  def index
    id = current_user.task_group.id
    @active_tasks = Task.where("is_submitted=true and task_group_id=?",id).all
    @inactive_tasks = Task.where("is_submitted=false and task_group_id=?",id).all

  end

  private

    def task_params
      params.require(:task).permit(:task_name)
    end

end
