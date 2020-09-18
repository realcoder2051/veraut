class AddressesController < InheritedResources::Base

  private

    def address_params
      params.require(:address).permit(:address1, :address2, :city, :state, :zip, :address_type, :general_id)
    end

end
