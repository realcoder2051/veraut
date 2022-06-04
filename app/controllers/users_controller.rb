class UsersController < ApplicationController
  # include Pagy::Backend
  # load_and_authorize_resource
  before_action :authenticate_user!

  before_action :build_resource, only: [:new, :create_users, :update]
  before_action :load_resource, only: [:destroy]
  before_action :fetch_user, only: %i[index]

  def index
    ransack_search = params[:q]
    @username = ransack_search[:username_cont] if ransack_search.present?
  end

  def change_password
    @user = current_user
  end

  def create_users
    if @resource.save
      redirect_to users_path
		else
			render :new
		end
  end

  def update_password
    if current_user.valid_password?(params[:old_password])
      if params[:user][:password] == params[:user][:password_confirmation]
        if params[:user][:password].length>=6
          flash[:notice] = "Your Password Update Successfully"
          current_user.update_attributes(password: params[:user][:password])
          redirect_to root_path
        else
          flash.now.alert = "New Password Length must be more than 5 characters"
          @user = current_user
          render :change_password
        end
      else
        flash.now.alert = "New Password and Confirm Password did not match"
        @user = current_user
        render :change_password
      end
    else
      flash.now.alert = "Incorrect Password"
      @user = current_user
      render :change_password
    end

  end

  def bulk_users
  end

  def create_bulk_users
    byebug
  end

  def show
    load_resource
  end

  def new
  end

  def edit
    load_resource
  end

	def create
    if @resource.save
      redirect_to users_path
		else
			render :new
		end
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @resource = User.find(params[:id])
    if @resource.update_attributes(resource_params)
      flash[:notice] = "User updated successfully."
			redirect_to users_path
		else
			render :edit
    end
  end

  def destroy
    destroy_resource
  end

  private
  def fetch_user
    @q = User.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'email asc' if @q.sorts.empty?
     end
    @users = result.paginate(:page => params[:page], per_page:10)
  end

  def resource_scope
    User.all.order('created_at')
  end

  def load_collection
    @pagy, @collection = pagy(resource_scope.ordered)
  end

  def load_resource
    @resource ||= resource_scope.find params[:id]
  end

  def build_resource
    @resource ||= resource_scope.build
    @resource.attributes = resource_params
  end

  def save_resource
    return unless @resource.save
    redirect_to @resource, notice: 'User successfully saved.'
  end

  def destroy_resource
    return unless @resource.destroy
    redirect_to users_path, notice: 'User successfully deleted.'
  end

  def resource_params
    return {} unless params[:user]
     params[:user].permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
