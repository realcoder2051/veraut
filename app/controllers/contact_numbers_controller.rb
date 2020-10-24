class ContactNumbersController < InheritedResources::Base

  def create
    contact_number = ContactNumber.new(contact_number_params)
		contact_number[:task_id] = session[:task_id]
    contact_number[:user_id] = current_user.id
    if contact_number.contact_type == ""
      session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
    end
    if contact_number.save
			redirect_to generals_path
    else
      @number = ContactNumber.new
			render :new
    end
  end

  def new
    @number = ContactNumber.new
  end

  def edit
    @number = ContactNumber.find(params[:id])
  end

  def update
    @contact_number = ContactNumber.find(params[:id])
    if params[:contact_number][:contact_type] == ""
      session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
    end
    if @contact_number.update_attributes(contact_number_params)
      redirect_to generals_path
    else
      render :edit
    end
    
  end

  def index
		@numbers = ContactNumber.where(user_id: current_user.id)
		@notes = Note.all
  end

  def destroy
    contact_number = ContactNumber.find(params[:id])
    if contact_number.update_attribute(:active, true)
			redirect_to generals_path
		end
	end

  private

    def contact_number_params
      params.require(:contact_number).permit(:number, :contact_type, :general_id)
    end

end
