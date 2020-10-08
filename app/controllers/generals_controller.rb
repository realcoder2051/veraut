class GeneralsController < InheritedResources::Base

  def update
    general = General.find(params[:id])
    if general.update_attributes(general_params)
      redirect_to generals_path
    end
  end

  def create
    general = General.new(general_params)
    if general.save
      redirect_to generals_path
    else
      redirect_to new_general_path
    end
  end

  def index
    #find_task(task)
			@addresses = Address.all.order('created_at').where(task_id: session[:task_id])
			@notes = Note.all
      @numbers = ContactNumber.all.order('created_at').where(task_id: session[:task_id])
  end

  def find_task
    task_id = params[:format].to_i
    if session[:task_id].nil?
      session[:task_id] = task_id
      redirect_to generals_path
    else
      session[:task_id] = task_id
      task = Task.find(task_id)
      task.update(flag: true)
      redirect_to generals_path
    end
  end

  private

    def general_params
      params.permit(:address_type, :address, :contact_type, :number)
    end

end
