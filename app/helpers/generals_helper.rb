module GeneralsHelper


  def find_address(id)
    address = Address.find(id)
    if address.address2.present?
      address.address1+", "+address.address2+", "+ address.city+", "+ address.state+", "+ address.zip
    else
      address.address1+", "+ address.city+", "+ address.state+", "+ address.zip
    end
  end

  def find_address_type(id)
    address_type = AddressType.find(id)
    address_type.task_name
  end

  def select_address_type
    @address_mapping.address_type_id if @address_mapping.present?
  end

  def view_address
    address = Address.find(address_mapping.address_id)
    address_path(address)
  end

  def select_existing_address
    @addresses.collect { |u| [u.address1 ,u.id] }
  end

  def store_data(address_mapping)
    session[:address_mapping] = address_mapping
  end

end
