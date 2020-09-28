class UsersController < ApplicationController
  include Pagy::Backend
  load_and_authorize_resource
  before_action :build_resource,only: [:new,:create,:update]
  before_action :load_resource,only: [:destroy]
  before_action :fetch_user, only: %i[index]


  def index
    ransack_search = params[:q]
    @username = ransack_search[:username_cont] if ransack_search.present?
    #@users = resource_scope
  end

  def show
    load_resource
  end

  def new
    @roles = Role.all 
  end

  def edit
    load_user
    @roles = Role.all
  end

  def create
    
    @roles = Role.all
    roles = params[:user][:name].drop(1)
    roles.each do |role|
      user_role = @resource.add_role role
    #  user_role.resource = @resource
    end
    save_resource or render :new
    
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    load_user
    previous_roles = @resource.roles
    previous_roles.each do |previous|
      @resource.remove_role previous.name
    end
    roles = params[:user][:name].drop(1)
    roles.each do |role|
      user = @resource.add_role role
     # user.resource = @resource
    end
    @resource.update_attributes(resource_params)
    redirect_to users_path
  end

  def destroy
    user_role = @resource.remove_role  @resource.name
    destroy_resource
    
  end

  private
  def fetch_user
    @q = User.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'username asc' if @q.sorts.empty?
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

  def load_user
    @resource = resource_scope.find params[:id]
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
     params[:user].permit(:username, :email, :password, :password_confirmation)
  end

end