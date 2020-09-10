class ContactsController < InheritedResources::Base

  private

    def contact_params
      params.require(:contact).permit(:name, :company_name, :email, :roles, :rights)
    end

end
