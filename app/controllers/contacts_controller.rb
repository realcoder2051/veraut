class ContactsController < InheritedResources::Base

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(contact_params)
      redirect_to contacts_path
    end
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      redirect_to contacts_path
    else
      redirect_to new_contact_path
    end
  end

  private

    def contact_params
      params.permit(:name, :company_name, :email, :roles, :rights)
    end

end
