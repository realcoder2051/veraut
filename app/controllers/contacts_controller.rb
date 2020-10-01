class ContactsController < InheritedResources::Base

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(contact_params)
      redirect_to contacts_path
    end
  end

	def edit
  	@contact = Contact.find(params[:id])
  end

  def create
    contact = Contact.new(contact_params)
    contact.update(task_id: session[:task_id])
    if contact.save
      redirect_to contacts_path
    else
      redirect_to new_contact_path
    end
  end

  def index
    @contacts = Contact.all.order('created_at').where(task_id: session[:task_id])
    @roles_rights = RolesRight.all
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :company_name, :email, :roles, :rights)
    end

end
