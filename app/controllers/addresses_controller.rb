class AddressesController < InheritedResources::Base

  def create
    address = Address.find(params[:address][:address1])
    address = Address.new(address1: address.address1,address2: address.address2,city: address.address1,state: address.state,zip: address.zip,address_type: params[:address][:address_type])
    if address.save
      redirect_to generals_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def add_new_address
    @address = Address.new
  end

  def new
    @address = Address.new
    @addresses = Address.all.order('created_at')
  end

  def create_new_address
    address = Address.new(address_params)
    if address.save
      redirect_to generals_path
    end
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
