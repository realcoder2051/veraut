class AddressesController < InheritedResources::Base
	before_action :fetch_address, only: %i[index]


  def create
    @address = Address.new(address_params)
    # address = Address.new(address1: address.address1,address2: address.address2,city: address.address1,state: address.state,zip: address.zip,address_type: params[:address][:address_type])
		@address[:task_id] = session[:task_id]
		@address[:user_id] = current_user.id

    if @address.save
			redirect_to generals_path
		else
			address_collection
			render :new
    end
	end
	
	def create_new_address
		@address = Address.new(address_params)
		@address[:task_id] = session[:task_id]
		@address[:user_id] = current_user.id
    if @address.save
			redirect_to generals_path
		else
			address_collection
			render :add_new_address
    end
	end

  def edit
    @address = Address.find(params[:id])
  end

  def add_new_address
		@address = Address.new
  end

  def new
    @address = Address.new
		address_collection
  end

  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(address_params)
			redirect_to generals_path
		else
			address_collection
			render :edit
    end
  end

  def index
		@address = Address.all.order('created_at').where(user_id: current_user.id)
		@notes = Note.all
  end

  def destroy
		address = Address.find(params[:id])
    if address.destroy
      redirect_to generals_path
    end
	end
	
	def get_address
		address = Address.find_by(id: params[:id])
    render json: { data: address }
	end
	


	private
	
	def address_collection
		@addresses = Address.all.order('created_at').where(user_id: current_user.id)
	end



	def address_params
		params.require(:address).permit(:address1, :address2, :city, :state, :zip, :address_type, :general_id)
	end

end
