class FamiliesController < InheritedResources::Base

  private

    def family_params
      params.require(:family).permit(:name, :relationship, :related_to)
    end

end
