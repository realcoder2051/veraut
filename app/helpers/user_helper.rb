module UserHelper

  def resource_available
    @resource.role[:id] if @resource.role.present?
  end

end
