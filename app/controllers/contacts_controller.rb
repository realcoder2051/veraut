class ContactsController < InheritedResources::Base
	before_action :stepper, only: %i[index]
	before_action :fetch_contact, only: %i[index]
	before_action :fetch_change_request, only: %i[contact_change_request_index]

	def update
		@contact_change_request = ContactChangeRequest.find(params[:id])
		if @contact_change_request.update_attributes(change_request_params)
      redirect_to view_requests_path
		else
			redirect_to view_requests_path
		end
	end

	def show
		@contact_change_request = ContactChangeRequest.find(params[:id])
	end

	def edit
  	@contact_change_request = ContactChangeRequest.find(params[:id])
	end

	def new
		@contact_change_request = ContactChangeRequest.new
	end

	def create
		@contact_change = ContactChangeRequest.new(change_request_params)
		@contact_change.created_by = current_user.id
		@contact_change.date = Date.current
		@contact_change_mapping = ChangeRequestMapping.new
		if @contact_change.save
			save_change_request_mapping
			@contact_change_mapping.save
      redirect_to contacts_path
    else
      redirect_to new_contact_path
    end
	end

	def save_contact_technician
		begin
			contact = Contact.new
			technician_role = Role.where(name: "Technician").first
			technician_user = User.find_by(role_id: technician_role.id)
			Contact.find_or_create_by(company_name: "Benefit Equity,Inc",email: technician_user.email,user_id: technician_user.id,is_completed: true,task_id: session[:task_id],role_id: technician_role.id)
		rescue
			return nil
		else
		end
	end

	def save_contact_main_contact
		begin
			main_contact_role = Role.where(name: "Main Contact").first
			main_contact_user = User.find_by(role_id: main_contact_role.id)
			Contact.find_or_create_by(company_name: "Benefit Equity,Inc",email: main_contact_user.email,user_id: main_contact_user.id,is_completed: true,task_id: session[:task_id],role_id: main_contact_role.id)
		rescue
			 return nil
		 else
		 end
	end

	def destroy
		@contact_change_requests = ContactChangeRequest.find(params[:id])
		if @contact_change_requests.destroy
			redirect_to view_requests_path
		end
	end

	def contact_change_request_index
		ransack_search = params[:q]
	end

	def index
		ransack_search = params[:q]
		@roles_rights = RolesRight.all
		@notes = Note.all
		technician_role = Role.where(name: "Technician").first
		main_contact_role = Role.where(name: "Main Contact").first
		@users = []
		@users << @technician_user = User.find_by(role_id: technician_role.id)
		@users << @main_contact_user = User.find_by(role_id: main_contact_role.id)
	end

	def is_completed
		save_contact_technician
		save_contact_main_contact
		#contact = Contact.where("is_completed=? AND user_id=? AND task_id=?", false , current_user.id , session[:task_id])
		#contact.update(is_completed: true)
		redirect_to plans_new_path
	end

	private

	def fetch_change_request
		@q = ContactChangeRequest.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'created_by asc' if @q.sorts.empty?
     end
    @contact_change_requests = result.paginate(:page => params[:page], per_page:10).order('created_at')
	end

	def fetch_contact
    @q = Contact.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @contacts = result.paginate(:page => params[:page], per_page:10).order('created_at').where(task_id: session[:task_id])
	end

	def save_change_request_mapping
		@contact_change_mapping.is_requested = true
		@contact_change_mapping.task_id = session[:task_id]
		@contact_change_mapping.user_id = current_user.id
		@contact_change_mapping.role_change_id = params[:user_id]
		@contact_change_mapping.contact_change_request_id = @contact_change.id
		@contact_change_mapping.save
	end

	def change_request_params
		params.require(:contact_change_request).permit(:change_request)
	end

	def contact_params
		params.require(:contact).permit(:name, :company_name, :email, :roles, :rights)
	end

end
