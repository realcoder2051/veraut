module RolesHelper
  def parse_json_array(roles)
    rights = Array.new
    roles["rights"].split(",").each do |role|
      rights.append(get_rights_by_names(role))
    end
    rights.join(",")
  end

  def get_rights_by_names(id)
    right = Right.find(id.to_i)
    right.right_type
  end

  def role_right_available(role_right)
    role_right.role.name if role_right.role.present?
  end

  def is_role_and_right_exist?
    if Role.all.length>0 and RolesRight.all.length>0
      return true
    end
    return false
  end

  def is_role_present?(roles_right)
    roles_right.role.users.first.present?
  end

  def get_username(contact)
    user = User.find(contact)
    user.username
  end

  def get_email(email)
    user = User.find_by(email: email)
    user.email
  end

  def get_role(role_id)
  begin
    role = Role.find(role_id)
  rescue
    return nil
  else
    return role.name
  end

  end

  def get_right(role_id)
    begin
      role = Role.find(role_id)
      roles_right = RolesRight.find_by(role_id: role.id)
    rescue
      return nil
    else
      parse_json_array(roles_right.role_type)
    end
  end

  def is_contact_exist?
    @contacts.first if @contacts.present?
  end

end
