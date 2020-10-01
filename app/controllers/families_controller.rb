class FamiliesController < InheritedResources::Base

  def edit
    @family = Family.find(params[:id])
  end

  def update
    family = Family.find(params[:id])
    if family.update_attributes(family_params)
      redirect_to families_path
    end
  end

  # def show
  #   @family = Family.find(params[:id])
  #   respond_to do |format|
  #     format.html
  #     format.json { render json: @family.to_json}
  #   end
  # end

  def index
    @families = Family.all.order('created_at').where(task_id: session[:task_id])
  end

  def create
    family = Family.new(family_params)
    family.update(task_id: session[:task_id])
    if family.save
      redirect_to families_path
    else
      redirect_to new_family_path
    end
  end

  private

  def family_params
    params.require(:family).permit(:name, :relationship, :related_to)
  end

end
