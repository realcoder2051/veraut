class ContactsController < InheritedResources::Base
	before_action :fetch_contact, only: %i[index]


  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      redirect_to contacts_path
		else 
			redirect_to contacts_path
		end
  end

	def edit
  	@contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
		@contact[:task_id] = session[:task_id]
    if @contact.save
      redirect_to contacts_path
    else
      redirect_to new_contact_path
    end
  end

	def index
		ransack_search = params[:q]
		@roles_rights = RolesRight.all
		@notes = Note.all

	end
	
	def is_completed
		contact = Contact.where("is_completed=? AND user_id=? AND task_id=?", false , current_user.id , session[:task_id])
		contact.update(is_completed: true)
		redirect_to plans_path
	end

	private
	
	def fetch_contact
    @q = Contact.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @contacts = result.paginate(:page => params[:page], per_page:10).order('created_at').where(task_id: session[:task_id])
  end


	def contact_params
		params.require(:contact).permit(:name, :company_name, :email, :roles, :rights)
	end

end
