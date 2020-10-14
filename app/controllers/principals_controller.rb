class PrincipalsController < InheritedResources::Base
	before_action :stepper, only: %i[index]
	before_action :fetch_principal, only: %i[index]


  def edit
    @principal = Principal.find(params[:id])
  end

  def update
    @principal = Principal.find(params[:id])
    if @principal.update_attributes(principal_params)
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
    principal = Principal.find(params[:id])
    if principal.destroy
      family = Family.where(related_to: principal.id)
      family.update(related_to: nil)
      redirect_to principals_path
    end
	end

	def is_completed
		principal = Principal.where("is_completed=? AND user_id=? AND task_id=?", false , current_user.id , session[:task_id])
		principal.update(is_completed: true)
		redirect_to families_path
	end

	private
	def fetch_principal
    @q = Principal.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @principals = result.paginate(:page => params[:page], per_page:10).order('officer ASC').where(user_id: current_user.id)
  end

	def principal_params
		params.require(:principal).permit(:name, :title, :officer, :ownership)
	end

end
