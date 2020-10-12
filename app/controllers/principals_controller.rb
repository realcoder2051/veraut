class PrincipalsController < InheritedResources::Base
	before_action :stepper, only: %i[index]

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
		@principals = Principal.all.order('created_at').where(user_id: current_user.id)
		@notes = Note.all
  end

  def destroy
    principal = Principal.find(params[:id])
    if principal.destroy
      family = Family.where(related_to: principal.id)
      family.update(related_to: nil)
      redirect_to principals_path
    end
  end

  private

    def principal_params
      params.require(:principal).permit(:name, :title, :officer, :ownership)
    end

end
