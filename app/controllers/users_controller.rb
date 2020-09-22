class UsersController < ApplicationController
  include Pagy::Backend
  load_and_authorize_resource

  def index
    @users = resource_scope
  end

  def show
    load_resource
  end

  def new
    @roles = Role.select(:name).distinct
    build_resource
  end

  def create
    build_resource
    roles = params[:user][:name]
    (roles.drop(1)).each do |role|
      user_role = @resource.add_role role
      user_role.resource = @resource
    end
    save_resource or render :new
  end

  def edit
    @roles = Role.select(:name).distinct
    load_resource
    params.except(:name)
  end

  def update
    @roles = Role.all
    load_resource
    #@user=User.find(params[:id])
    build_resource
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    roles = params[:user][:name]
    (roles.drop(1)).each do |role|
      user_role = @resource.add_role role
      user_role.resource = @resource
      #user_role.resource.roles.update_attributes(resource_params)
    end
    @resource.update_attributes(resource_params)
    redirect_to users_path
  end

  def destroy
    load_resource
    user_role = @resource.remove_role  @resource.name
    destroy_resource
  end

  private

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
    #Ability.new(@resource)
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
    params[:user].permit(:username, :email, :name, :password, :password_confirmation)
  end

end
