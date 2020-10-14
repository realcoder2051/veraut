class ContactChangeRequestsController < InheritedResources::Base

  private

    def contact_change_request_params
      params.require(:contact_change_request).permit(:date, :created_by, :change_request)
    end

end
