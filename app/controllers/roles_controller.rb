class RolesController < InheritedResources::Base

  def create
    role = Role.new(role_params)
    if role.save
      redirect_to roles_path
    end
  end

  def new
    @role = Role.new
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    role = Role.find(params[:id])
    if role.update_attributes(role_params)
      redirect_to roles_path
    end
  end

  def index
    @roles = Role.all.order('created_at')
  end

  def destroy
    role = Role.find(params[:id])
    if role.destroy
      redirect_to roles_path
    end
  end

  def assign_role_new

  end

  def assign_role_create

  end

  def assign_role_index
    @roles = Role.all.order('created_at')
  end

  def assign_role_edit
    @users = User.all
    @role = Role.find(params[:id])
  end

  def assign_role_update
    role = Role.find(params[:id])
    if role.update_attributes(role_params)
      redirect_to roles_path
    end
  end

  def assign_role_destroy
    role = Role.find(params[:id])
    if role.destroy
      redirect_to roles_path
    end
  end

  private

    def role_params
      params.require(:role).permit(:role_name)
    end
    def assign_role_params
      params.require(:role).permit(:role_name,:user_id)
    end

end
