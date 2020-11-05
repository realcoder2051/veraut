class FamiliesController < InheritedResources::Base
	before_action :stepper, only: %i[index]
  before_action :fetch_family, only: %i[index]
  before_action :find_family,only: [:edit,:update,:destroy]
  before_action :load_family_principal,only: [:edit,:new,:update,:create]
  before_action :find_task, only: %i[is_completed update create destroy]

  def find_task
    @task = Task.find(session[:task_id])
  end

  def find_family
    @family = Family.find(params[:id])
  end

  def edit
  end

  def new
    @family = Family.new
  end

  def update
    @family.is_completed = false
    if @family.update_attributes(family_params)
      redirect_to families_path
      @task.steppers["family"] = false
      @task.save
    else
			render :edit
    end
  end

  def index
		ransack_search = params[:q]
		@notes = Note.all
  end

  def create
    @family = Family.new(family_params)
		@family[:task_id] = session[:task_id]
    @family[:user_id] = current_user.id
    if @family.save
      @task.steppers["family"] = false
			@task.save
      redirect_to families_path
    else
      render :new
    end
  end

  def destroy
    if @family.update_attributes(active: true)
      @task.steppers["family"] = false
			@task.save
      redirect_to families_path
    end
  end

	def is_completed
		families = Family.where("is_completed=? AND user_id=? AND active = ? AND task_id=?", false , current_user.id ,false, session[:task_id])
    status=true
    if families.length == 0
      @task.steppers["family"] = true
      @task.save
    else
      families.each do |family|
        if family.related_to == "" || family.relationship =="" || family.name==""
          status = false
          @task.steppers["family"] = false
					@task.save
        else
          family.update(is_completed: true)
        end
      end
    end
    if status
      @task.steppers["family"] = true
      @task.save
      redirect_to businesses_path
    else
      task.steppers["family"] = false
      @task.save
     redirect_to families_path
    end
	end

	private

	def fetch_family
    @q = Family.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @families = result.paginate(:page => params[:page], per_page:10).order('created_at').where("task_id = ? and active = ?",session[:task_id],false)
  end

  def family_params
    params.require(:family).permit(:name, :relationship, :related_to)
  end

  def load_family_principal
    @principals = Principal.where("task_id = ? and active = ?",session[:task_id],false)
  end

end
