class FamiliesController < InheritedResources::Base
	before_action :stepper, only: %i[index]

  def edit
    @family = Family.find(params[:id])
    @principals = Principal.all.where(task_id: session[:task_id])
  end

  def new
    @family = Family.new
    @principals = Principal.all.where(task_id: session[:task_id])
  end

  def update
    @principals = Principal.all.where(task_id: session[:task_id])
    @family = Family.find(params[:id])
    if @family.update_attributes(family_params)
      redirect_to families_path
		else
			render :edit
		end
  end

  def index
		@families = Family.all.order('created_at').where(task_id: session[:task_id])
		@notes = Note.all
  end

  def create
    @principals = Principal.all.where(task_id: session[:task_id])
    @family = Family.new(family_params)
		@family[:task_id] = session[:task_id]
    if @family.save
      redirect_to families_path
    else
      render :new
    end
  end

  private

  def family_params
    params.require(:family).permit(:name, :relationship, :related_to)
  end

end
