module GeneralsHelper

  def find_address(id)
    address = Address.find(id)
    address_array = Array.new
    address_array = address_array.append(address&.address1)
    address_array = address_array.append(address&.address2)
    address_array = address_array.append(address&.city)
    address_array = address_array.append(address&.state)
    address_array = address_array.append(address&.zip)
    address_array.reject{|c| c.empty?}
    address_str=address_array.reject{|c| c.empty?}.join(',')
  end

  def find_address_type(id)
    if id.present?
      address_type = AddressType.find(id)
      address_type.address_type
    end
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
