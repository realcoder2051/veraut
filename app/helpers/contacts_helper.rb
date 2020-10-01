module ContactsHelper

  def parse_json_array(roles)
    rights = Array.new
    roles["rights"].split(",").each do |role|
      rights.append(get_rights_by_names(role))
    end
    rights.join(",")
  end

end
