class AddressesController < InheritedResources::Base
	before_action :fetch_address, only: %i[index]
	before_action :find_task, only: %i[create_new_address create update destroy]

	def find_task
		@task = Task.find(session[:task_id])
	end

	def create
		if params[:address][:id].present?
			@address = Address.find(params[:address][:id])
			address_type=AddressMapping.where(task_id: session[:task_id],active: true).pluck(:address_type_id)
			if address_type.include?(params[:Address_Type].to_i)
				flash[:alert] = "Address with this Address Type Already Exist"
				address_collection
				@address = Address.new
				render :new
			elsif @address.present?
				save_address_mapping
				@task.steppers["general"] = false
				@task.save
				redirect_to generals_path
			end
		else
			address_collection
			@address = Address.new
			render :new
		end
	end

	def edit_address_call
		@address = Address.new(address_params)
		@address[:active] = true
		@address[:task_id] = session[:task_id]
		@address[:user_id] = current_user.id
	end


	def create_new_address
		save_address
		if @address.address1 == "" || @address.city == "" || @address.state == "" || @address.zip == ""
			flash[:alert] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
		end
		if @address.save
			@task.steppers["general"] = false
			@task.save
			save_address_mapping
			redirect_to generals_path
		else
			address_collection
			render :add_new_address
		end
	end

	def update
		@old_address = Address.find(params[:id])
		status = AddressMapping.where(task_id: session[:task_id],active: true).pluck("address_type_id").include?(params[:Address_Type].to_i)
		if status == true
			if AddressMapping.find(params[:old_address_mapping]).address_type_id.to_s != params[:Address_Type]
				flash[:alert] = "Address with this Address Type Already Exist"
			end
		end

		if !(flash[:alert].present?)
			edit_address_call
			if params[:address][:address1] == "" || params[:address][:city] == "" || params[:address][:state] == "" || params[:address][:zip] == ""
				flash[:alert] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
				@task.steppers["general"] = false
				@task.save
			end
			if @address.save
				@old_address.update(active: false)
				@old_address.address_mappings.where(active: true).each do |p|
						address_mapping = AddressMapping.find(p.id)
						new_address_mapping = AddressMapping.new
						new_address_mapping.address_id = @address.id
						if address_mapping.id == params[:old_address_mapping].to_i
							new_address_mapping.address_type_id =  params[:Address_Type]
						else
							new_address_mapping.address_type_id = address_mapping.address_type_id
						end
						new_address_mapping.user_id = current_user.id
						new_address_mapping.task_id = session[:task_id]
						new_address_mapping.active = true
						new_address_mapping.save
					end
					@old_address.address_mappings.where(active: true).update(active: false)
					redirect_to generals_path
			else
				# session[:error] = @address.errors.to_a
				address_collection
				redirect_to params[:edit_url]
			end
		else
			address_collection
			redirect_to params[:edit_url]
		end

	end

	def edit
		@address = Address.find(params[:id])
		@address_types = AddressType.all
		@address_mapping = AddressMapping.find(params[:address_mapping])
  end

  def add_new_address
		@address = Address.new
		@address_types = AddressType.all
  end

	def new
		@address = Address.new
		address_collection
  end
	def destroy
		address = Address.find(params[:id])
		if address.address_mappings.where(active: true).count <= 1
			address.update(active: false)
		end
		address_mapping = AddressMapping.find(params[:address_mapping])
		if address_mapping.update(active: false)
			@task.steppers["general"] = false
			@task.save
      redirect_to generals_path
    end
	end

	def get_address
		address = Address.find_by(id: params[:id])
    render json: { data: address }
	end

	def edit_address
		@addresses = Address.where(task_id: session[:task_id],active: true)
		status = true

	end

	def save_address
		@addresses = Address.where(task_id: session[:task_id],active: true)
		status=true
		@addresses.each do |address|
			if address&.address_mappings.where(task_id: session[:task_id],active: true).pluck(:address_type_id).include?(params[:Address_Type].to_i)				
				address.update_attributes(active: false)
				address.address_mappings.update_all(active: false)
				@address = Address.new(address_params)
				@address[:active] = true
				@address[:task_id] = session[:task_id]
				@address[:user_id] = current_user.id
				status = false
			end
		end
		if status
			@address = Address.new(address_params)
			@address[:active] = true
			@address[:task_id] = session[:task_id]
			@address[:user_id] = current_user.id
		end
	end

	def save_address_mapping
		address_mapping = AddressMapping.new
		address_mapping.address_type_id  = params[:Address_Type]
		address_mapping.address_id = @address.id
		address_mapping.active = true
		address_mapping.user_id = current_user.id
		address_mapping.task_id = session[:task_id]
		address_mapping.save
	end

	def show
		address_mapping = AddressMapping.find(params[:id])
		if address_mapping.address_type_id.present?
			@address_type = AddressType.find(address_mapping.address_type_id)
		end
		@address = Address.find(address_mapping.address_id)
	end

	private

	def address_collection
		@addresses = Address.where("task_id = ? and active = ?" ,session[:task_id],true)
		@address_types = AddressType.all
	end

	def address_params
		params.require(:address).permit(:address1, :address2, :city, :state, :zip, :general_id,:active)
	end

	def address_mapping_params
		params.permit(:Address_Type)
	end

end
