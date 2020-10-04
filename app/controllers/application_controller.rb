class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout 'stack/application'

  private
  rescue_from CanCan::AccessDenied do |exception|
   # render 'shared/flash'
    flash[:error] = t 'cancan.access_denied'
    respond_to do |format|
      #format.html { redirect_to root_url }
      format.html { redirect_to root_url,error: "Book not found"}
    end
  end

  protected
  def after_sign_in_path_for(_)
    root_path
  end

  def after_sign_out_path_for(_)
    root_path
  end

end
