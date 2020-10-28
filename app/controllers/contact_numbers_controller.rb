class ContactNumbersController < InheritedResources::Base

  def create
    contact_number = ContactNumber.new(contact_number_params)
		contact_number[:task_id] = session[:task_id]
    contact_number[:user_id] = current_user.id
    if contact_number.contact_type == ""
      session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
      contact_number.save
      redirect_to generals_path
    else
      if check_contact_number_already_exist?(contact_number)
        session[:error] = "Contact Number with this Contact type already exist"
        @number = ContactNumber.new
        render :new
      else
        contact_number.save
			  redirect_to generals_path
      end
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
      @contact_number.update_attributes(contact_number_params)
      session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
      @contact_number.is_completed = false
      redirect_to generals_path
    else
      if check_contact_number_is_exist?
        session[:error] = "Contact Number with this Contact type already exist"
        @number = @contact_number
        render :edit
      else
        @contact_number.update_attributes(contact_number_params)
			  redirect_to generals_path
      end
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

    def check_contact_number_already_exist?(contact_number)
      result = ContactNumber.where("number = ? and contact_type = ? and user_id = ? and active = ?",contact_number.number,contact_number.contact_type,contact_number.user_id,false)
      result.count > 0 ? true : false
    end

    def check_contact_number_is_exist?
      result = ContactNumber.where("number = ? and contact_type = ? and active = ?",params[:contact_number][:number],params[:contact_number][:contact_type],false)
      result.count > 0 ? true : false
    end

end
