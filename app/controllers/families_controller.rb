class FamiliesController < InheritedResources::Base
	before_action :stepper, only: %i[index]
	before_action :fetch_family, only: %i[index]


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
		ransack_search = params[:q]
		@notes = Note.all
  end

  def create
    @principals = Principal.all.where(task_id: session[:task_id])
    @family = Family.new(family_params)
		@family[:task_id] = session[:task_id]
		@family[:user_id] = current_user.id
    if @family.save
      redirect_to families_path
    else
      render :new
    end
	end
	
	def is_completed
		family = Family.where("is_completed=? AND user_id=? AND task_id=?", false , current_user.id , session[:task_id])
		family.update(is_completed: true)
		redirect_to businesses_path
	end


	private
	
	def fetch_family
    @q = Family.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @families = result.paginate(:page => params[:page], per_page:10).order('created_at').where(user_id: current_user.id)
  end

  def family_params
    params.require(:family).permit(:name, :relationship, :related_to)
  end

end
