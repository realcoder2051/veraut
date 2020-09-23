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
    @roles = Role.all
  end

  def destroy
    role = Role.find(params[:id])
    if role.destroy
      redirect_to roles_path
    end
  end

  private

    def role_params
      params.require(:role).permit(:name,:resource_id,:resource_type)
    end

end
