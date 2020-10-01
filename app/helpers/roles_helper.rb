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

end
