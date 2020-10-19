class AddressesController < InheritedResources::Base
	before_action :fetch_address, only: %i[index]

  def create
		save_address
		if @address.save
			save_address_mapping
			redirect_to generals_path
		else
			address_collection
			render :new
    end
	end

	def create_new_address
		save_address
		if @address.save
			save_address_mapping
			redirect_to generals_path
		else
			address_collection
			render :add_new_address
    end
	end

  def edit
		@address = Address.find(params[:id])
		@address_types = AddressType.all
  end

  def add_new_address
		@address = Address.new
		@address_types = AddressType.all
  end

  def new
		@address = Address.new
		@addresses = Address.where('active = ?','true')
		@address_types = AddressType.all
  end

  def update
		@previous_address = Address.find(params[:id])
		@previous_address.update(active: false)
		@previous_address.address_mapping.update(active: false)
		save_address
		if @address.save
			save_address_mapping
			redirect_to generals_path
		else
			address_collection
			render :edit
    end
  end

  # def index
	# 	@address = Address.all.order('created_at').where(user_id: current_user.id)
	# 	#@address_mappings = AddressMapping.order('created_at').where(active: true)
	# 	@notes = Note.all
  # end

  def destroy
		address = Address.find(params[:id])
		address.update(active: false)
    if address.address_mapping.update(active: false)
      redirect_to generals_path
    end
	end

	def get_address
		address = Address.find_by(id: params[:id])
    render json: { data: address }
	end

	def save_address
		@address = Address.new(address_params)
		@address[:task_id] = session[:task_id]
		@address[:user_id] = current_user.id
	end

	def save_address_mapping
		address_mapping = AddressMapping.new
		address_mapping.address_type_id  = params[:Address_Type]
		address_mapping.address_id = @address.id
		address_mapping.active = true
		address_mapping.save
	end

	def show
		@address = Address.find(params[:id])
	end

	private

	def address_collection
		@addresses = Address.all.order('created_at').where(user_id: current_user.id)
		@address_types = AddressType.all
	end

	def address_params
		params.require(:address).permit(:address1, :address2, :city, :state, :zip, :general_id,:active)
	end

	def address_mapping_params
		params.permit(:Address_Type)
	end

end
