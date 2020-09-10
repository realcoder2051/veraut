class PrincipalsController < InheritedResources::Base

  private

    def principal_params
      params.require(:principal).permit(:name, :title, :officer, :ownership)
    end

end
