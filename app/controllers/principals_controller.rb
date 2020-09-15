class PrincipalsController < InheritedResources::Base

  def update
    principal = Principal.find(params[:id])
    if principal.update_attributes(principal_params)
      redirect_to principals_path
    end
  end

  def create
    principal = Principal.new(principal_params)
    if principal.save
      redirect_to principals_path
    else
      redirect_to new_principal_path
    end
  end

  private

    def principal_params
      params.permit(:name, :title, :officer, :ownership)
    end

end
