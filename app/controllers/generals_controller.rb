class GeneralsController < InheritedResources::Base
	before_action :stepper, only: %i[index]
	before_action :fetch_address, only: %i[index]
	before_action :find_current_task, only: %i[is_completed]

	def find_current_task
		@task = Task.find(session[:task_id])
	end

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
		ransack_search = params[:q]
		@notes = Note.all
		@q = ContactNumber.where("active=?",false).ransack(params[:q])
		result = @q.result
		@numbers = result.order('contact_type ASC').where(task_id: session[:task_id])
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
		address_mappings = AddressMapping.where(" task_id=? and active =?", session[:task_id],true)
		contact_numbers = ContactNumber.where("is_completed=? AND user_id=? AND task_id=? and active = ?", false , current_user.id , session[:task_id],false)
		status = true
		address_mappings.each do |address_mapping|
			address = Address.find(address_mapping.address_id)
			if address.address1 == "" || address.city == "" || address.state == "" || address.zip == ""
				status = false
			else
				if address.is_completed==true
				else
					address.update_attributes(is_completed: true)
					address_mapping.update(is_completed: true)
				end
			end
		end
		contact_numbers.each do |contact_number|
			if contact_number.contact_type == ""
			else
				contact_number.update(is_completed: true)
			end
		end
		if status && address_mappings.length>0
			@task.steppers["general"] = true
			@task.save
			redirect_to new_company_path
		else
			@task.steppers["general"] = false
			@task.save
			redirect_to generals_path
		end
	end

	private
		def fetch_address
			@q = AddressMapping.joins(:address).where("address_mappings.active=? and address_mappings.task_id =? ",true, session[:task_id]).ransack(params[:q])
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