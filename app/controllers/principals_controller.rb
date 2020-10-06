class PrincipalsController < InheritedResources::Base

  def edit
    @principal = Principal.find(params[:id])
  end

  def update
    principal = Principal.find(params[:id])
    if principal.update_attributes(principal_params)
      redirect_to principals_path
    end
  end

  def create
    principal = Principal.new(principal_params)
    principal[:task_id] = session[:task_id]
    if principal.save
      redirect_to principals_path
    else
      redirect_to new_principal_path
    end
  end

  def index
    @principals = Principal.all.order('created_at').where(task_id: session[:task_id])
  end

  private

    def principal_params
      params.require(:principal).permit(:name, :title, :officer, :ownership)
    end

end
