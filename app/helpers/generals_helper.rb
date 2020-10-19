module GeneralsHelper

  def find_address(id)
    address = Address.find(id)
    address.address1+", "+address.address2+", "+ address.city+", "+ address.state+", "+ address.zip
  end

  def find_address_type(id)
    address_type = AddressType.find(id)
    address_type.task_name
  end

  def edit_address(address_mapping)
    address = Address.find(address_mapping.address_id)
    edit_address_path(address)
  end

  def select_address_type
    @address.address_mapping[:address_type_id] if @address.address_mapping.present?
  end

  def view_address_type
    id = @address.address_mapping[:address_type_id]if @address.address_mapping.present?
    AddressType.find(id).task_name
  end

  def view_address
    address = Address.find(address_mapping.address_id)
    address_path(address)
  end

  def select_existing_address
    @addresses.collect { |u| [u.address1 ,u.id] }
  end

  def delete_address(address_mapping)
    address = Address.find(address_mapping.address_id)
    address_path(address)
  end

  def view_address(address_mapping)
    address = Address.find(address_mapping.address_id)
    address_path(address)
  end

end
