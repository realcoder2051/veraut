class GeneralsController < InheritedResources::Base

  private

    def general_params
      params.require(:general).permit(:address_type, :address, :contact_type, :number)
    end

end
