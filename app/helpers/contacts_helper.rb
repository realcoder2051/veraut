module ContactsHelper

  def parse_json_array(roles)
    rights = Array.new
    roles["rights"].split(",").each do |role|
      rights.append(get_rights_by_names(role))
    end
    rights.join(",")
  end

  def find_rights(role)
    roles_right = RolesRight.find_by(role_id: role.id)
    parse_json_array(roles_right.role_type)
  end

  def is_already_requested(user)
    contact_change_request = ChangeRequestMapping.find_by(role_change_id: user.id,task_id: session[:task_id])
  end

  def find_contact_change_request(user)
    ChangeRequestMapping.find_by(role_change_id: user.id).contact_change_request.id
  end

  def find_created_by_user(contact_change_request)
    created_by_id = contact_change_request.created_by
    User.find(created_by_id).username
  end

  def find_tasks(contact_change_request)
    contact_change_request.change_request_mapping.task_id==session[:task_id] if contact_change_request.change_request_mapping.present?
  end

  def total_view_requests
    count = ChangeRequestMapping.where(task_id: session[:task_id]).pluck("role_change_id").count if ChangeRequestMapping.where(task_id: session[:task_id]).present?
    if count > 1
      return count-1
    else
      return count
    end
  end

end
