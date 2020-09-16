class FamiliesController < InheritedResources::Base

  # def edit
  #   render json: Family.find(params[:id]),:layout => false
  # end

  def edit
    @family = Family.find(params[:id])
    render json: @family
  end

  def update
    @family = Family.find(params[:id])
    if @family.update_attributes(family_params)
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
    @families = Family.all.order('created_at')
  end

  def create
    family = Family.new(family_params)
    if family.save
      redirect_to families_path
    else
      redirect_to new_family_path
    end
  end

  private

  def family_params
    params.permit(:name, :relationship, :related_to)
  end

end
