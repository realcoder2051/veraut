class FamiliesController < InheritedResources::Base

  def edit
    render json: Family.find(params[:id]),:layout => false
  end

  def update
    @family = Family.find(params[:id])
    if @family.update_attributes(family_params)
      redirect_to families_path
    end
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
