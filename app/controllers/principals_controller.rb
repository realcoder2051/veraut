class PrincipalsController < InheritedResources::Base
	before_action :stepper, only: %i[index]
  before_action :fetch_principal, only: %i[index]
  before_action :find_principal,only: [:edit,:update,:destroy]
  before_action :find_task,only: %i[is_completed update destroy create]

  def find_task
    @task = Task.find(session[:task_id])
  end

  def find_principal
    @principal = Principal.find(params[:id])
  end

  def edit
  end

  def update
    @principal.is_completed = false
    if @principal.update_attributes(principal_params)
      @task.steppers["principal"] = false
      @task.save
      redirect_to principals_path
		else
			render :edit
		end
  end

  def create
    @principal = Principal.new(principal_params)
		@principal[:task_id] = session[:task_id]
    @principal[:user_id] = current_user.id
    if @principal.save
      @task.steppers["principal"] = false
      @task.save
      redirect_to principals_path
    else
      render :new
		end
  end

  def index
		@notes = Note.all
		ransack_search = params[:q]
  end

  def destroy
    if @principal.update_attribute(:active, true)
      family = Family.where(related_to: @principal.id)
      family.update_all(related_to: nil)
      @task.steppers["principal"] = false
			@task.save
      redirect_to principals_path
    end
	end

  def is_completed
		principals = Principal.where("is_completed=? AND user_id=? AND task_id=? AND active = ?", false , current_user.id , session[:task_id],false)
    principals.each do |principal|
      if principal.name == "" || principal.title == "" || principal.ownership.to_s == ""
        @task.steppers["principal"] = true
        @task.save
      else
        principal.update(is_completed: true)
      end
    end
    result = Principal.calculate_total_ownership(session[:task_id])
    if result >= 100
      @task.steppers["principal"] = true
      @task.save
      redirect_to families_path
    else
      @task.steppers["principal"] = false
      @task.save
      redirect_to principals_path
    end
	end

	private
	def fetch_principal
    @q = Principal.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @principals = result.paginate(:page => params[:page], per_page:10).order('officer ASC').where("task_id =? and active = ?",session[:task_id],false)
  end

	def principal_params
		params.require(:principal).permit(:name, :title, :officer, :ownership)
	end

end
