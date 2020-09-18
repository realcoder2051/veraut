class GeneralsController < InheritedResources::Base

  def update
    general = General.find(params[:id])
    if general.update_attributes(general_params)
      redirect_to generals_path
    end
  end

  def create
    general = General.new(general_params)
    if general.save
      redirect_to generals_path
    else
      redirect_to new_general_path
    end
  end

  def index
    @addresses = Address.all
    @numbers = ContactNumber.all
  end

  private

    def general_params
      params.permit(:address_type, :address, :contact_type, :number)
    end

end
