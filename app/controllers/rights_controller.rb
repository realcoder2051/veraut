class RightsController < InheritedResources::Base

  def create
    right = Right.new(right_params)
    if right.save
      redirect_to rights_path
    end
  end

  def new
    @right = Right.new
  end

  def edit
    @right = Right.find(params[:id])
  end

  def update
    right = Right.find(params[:id])
    if right.update_attributes(right_params)
      redirect_to rights_path
    end
  end

  def index
    @rights = Right.all
  end

  def destroy
    right = Right.find(params[:id])
    roles_right = RolesRight.all
    roles_right.each do |role_right|
      rights = role_right.role_type
      role = rights["rights"].split(",")
      if role.include?(right.id.to_s)
        role.delete(right.id.to_s)
        rights = parse_json_array(role)
        role_right.update(role_type: rights)
      end
    end
    if right.destroy
      redirect_to rights_path
    end
  end

  private

    def right_params
      params.require(:right).permit(:right_type,:resource_id,:resource_type)
    end

    def parse_json_array(roles)
      temp=""
      roles.each do |role|
        temp = temp + role+","
      end
      roles = temp.chop()
      rights = { rights: roles }
    end

end
