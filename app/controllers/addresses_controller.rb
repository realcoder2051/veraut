class AddressesController < InheritedResources::Base

  def create
    address = Address.new(address_params)
    if address.save
      redirect_to generals_path
    end
  end

  def edit
    @addresses = Address.all
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update_attributes(address_params)
      redirect_to generals_path
    end
  end

  def index
    @address = Address.all.order('created_at')
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      redirect_to generals_path
    end
  end


  private

    def address_params
      params.require(:address).permit(:address1, :address2, :city, :state, :zip, :address_type, :general_id)
    end

end
