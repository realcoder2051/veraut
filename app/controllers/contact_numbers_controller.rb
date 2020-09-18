class ContactNumbersController < InheritedResources::Base

  def create
    contact_number = ContactNumber.new(contact_number_params)
    if contact_number.save
      redirect_to generals_path
    end
  end

  def edit
    @numbers = ContactNumber.all
    contact_number = ContactNumber.find(params[:id])
    render json: contact_number
  end

  def update
    contact_number = ContactNumber.find(params[:id])
    if contact_number.update_attributes(contact_number_params)
      redirect_to generals_path
    end
  end

  def index
    @numbers = ContactNumber.all.order('created_at')
  end

  def destroy
    contact_number = ContactNumber.find(params[:id])
    if contact_number.destroy
      redirect_to generals_path
    end
  end

  private

    def contact_number_params
      params.permit(:number, :contact_type, :general_id)
    end

end
