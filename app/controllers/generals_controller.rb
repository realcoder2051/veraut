class GeneralsController < InheritedResources::Base
	before_action :stepper, only: %i[index]
	before_action :fetch_address, only: %i[index]

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
		#find_task(task)
		ransack_search = params[:q]
		# @address_type = ransack_search[:first_name_cont] if ransack_search.present?
		@notes = Note.all
		@q = ContactNumber.where("active=?",false).ransack(params[:q])
		result = @q.result
		@numbers = result.paginate(:page => params[:page], per_page:10).order('contact_type ASC').where(user_id: current_user.id)
	end

	def find_task
		task_id = params[:format].to_i
		session[:task_id] = task_id
		session[:error] = nil
		task = Task.find(task_id)
		if task.update(flag: true)
			redirect_to generals_path
		end
	end

	def is_completed
		address = Address.where("is_completed=? AND user_id=? AND task_id=?", false , current_user.id , session[:task_id])
		contact_number = ContactNumber.where("is_completed=? AND user_id=? AND task_id=?", false , current_user.id , session[:task_id])
		address.update(is_completed: true)
		contact_number.update(is_completed: true)
		redirect_to new_company_path
	end

	private
		def fetch_address
			@q = AddressMapping.joins(:address).where("address_mappings.active=? and address_mappings.user_id =? ",true, current_user.id).ransack(params[:q])
			@address_mappings = @q.result
			# if result.count.positive?
			#@q.sorts = 'address_type asc' if @q.sorts.empty?
			#end
			# @addresses = result.paginate(:page => params[:page], per_page:10).order('address_type ASC').where(user_id: current_user.id)
			# @address_mappings = result.paginate(:page => params[:page], per_page:10).order('address_type_id ASC')
	end

	def general_params
		params.permit( :address, :contact_type, :number)
	end

	end