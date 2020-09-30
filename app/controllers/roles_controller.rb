class RolesController < InheritedResources::Base

  def create
    role = Role.new(role_params)
    if role.save!
      rights = params[:role][:right_type].drop(1)
      role_id = role.id
      rights = { rights: rights.join(',') }
      role_right = RolesRight.new(role_id: role_id, role_type: rights)
      if role_right.save!
        redirect_to roles_path
      end
    end
  end

  def new
    @role = Role.new
    @rights = Right.all
  end

  def edit
    @roles_right = RolesRight.find(params[:id])
    @role = Role.find(@roles_right.role.id)
    @rights = Right.all
  end

  def show
    @roles_right = RolesRight.find(params[:id])
  end

  def update
    role = Role.find(params[:id])
    rights = params[:role][:right_type].drop(1)
    rights = { rights: rights.join(',') }
    roles_right = RolesRight.find(params[:role][:role_right_id])
    roles_right.update(role_id: role.id,role_type: rights)
    if role.update_attributes(role_params)
      redirect_to roles_path
    end
  end

  def index
    @rights = Right.all
    @roles_rights = RolesRight.all
  end
  def destroy
    role_right = RolesRight.find(params[:id])
    if role_right.role.destroy
      if role_right.destroy
        redirect_to roles_path
      end
    end
  end

  private

    def role_params
      params.require(:role).permit(:name,:resource_id,:resource_type)
    end

end
