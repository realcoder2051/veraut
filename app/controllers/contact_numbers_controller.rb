class ContactNumbersController < InheritedResources::Base

  def create
    contact_number = ContactNumber.new(contact_number_params)
    contact_number[:task_id] = session[:task_id]
    if contact_number.save
      redirect_to generals_path
    end
  end

  def new
    @numbers = ContactNumber.all.where(task_id: session[:task_id])
    @number = ContactNumber.new
  end

  def add_new_contact_number
    @number = ContactNumber.new
  end

  def create_new_contact_number
    contact_number = ContactNumber.new(contact_number_params)
    contact_number.update(task_id: session[:task_id])
    if contact_number.save
      redirect_to generals_path
    end
  end

	def edit
    @number = ContactNumber.find(params[:id])
  end

  def update
    contact_number = ContactNumber.find(params[:id])
    if contact_number.update_attributes(contact_number_params)
      redirect_to generals_path
    end
  end

  def index
    @numbers = ContactNumber.all.order('created_at').where(task_id: session[:task_id])
  end

  def destroy
    contact_number = ContactNumber.find(params[:id])
    if contact_number.destroy
      redirect_to generals_path
    end
  end

  private

    def contact_number_params
      params.require(:contact_number).permit(:number, :contact_type, :general_id)
    end

end
