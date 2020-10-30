class TasksController < InheritedResources::Base
  load_and_authorize_resource

  def new
    @task = Task.new
  end

  def create
    previous_task = TaskGroup.find_by("user_id = ?",current_user.id).tasks&.last
    @task = Task.new(task_params)
    @task.update(task_group_id: current_user.task_group.id)
    if @task.save
      if previous_task.present?
        create_address(previous_task)
        create_contact_numbers(previous_task)
        create_principals(previous_task)
        create_families(previous_task)
        create_businesses(previous_task)
        redirect_to tasks_path
      else
        redirect_to tasks_path
      end
    end
  end

  def create_principals(previous_task)
    principals = Principal.where("task_id = ? and active =?",previous_task.id,false)
    principals.each do |principal|
      Principal.create(name: principal.name,title: principal.title,officer: principal.officer,ownership: principal.ownership,task_id: @task.id,user_id: current_user.id)
    end
  end

  def create_families(previous_task)
    families = Family.where("task_id = ? and active = ?",previous_task.id,false)
    families.each do |family|
      Family.create(name: family.name,relationship: family.relationship,related_to: family.related_to,task_id: @task.id,user_id: current_user.id)
    end
  end

  def create_businesses(previous_task)
    businesses = Business.where("task_id = ? and active = ?",previous_task.id,false)
    businesses.each do |business|
      Business.create(name: business.name,ein: business.ein,date_purchased_or_sold: business.date_purchased_or_sold ,address: business.address,city: business.city,state: business.state,zip: business.zip,phone: business.phone,does_company_have_employees: business.does_company_have_employees,qualified_plan_sponsored: business.qualified_plan_sponsored,entity_type: business.entity_type,task_id: @task.id,user_id: current_user.id)
    end
  end

  def create_contact_numbers(previous_task)
    contact_numbers = ContactNumber.where("task_id = ? and active = ?",previous_task.id,false)
    contact_numbers.each do |contact_number|
      ContactNumber.create(number: contact_number.number,contact_type: contact_number.contact_type,task_id: @task.id,user_id: current_user.id)
    end
  end

  def create_address(previous_task)
    addresses = Address.where("task_id = ? and active = ?",previous_task.id,false)
    addresses.each do |address|
      Address.create(address1: address.address1,address2: address.address2,city: address.city,state: address.state,zip: address.zip,task_id: @task.id,user_id: current_user.id)
    end
    address_mappings = AddressMapping.where("task_id = ? and active = ?",previous_task.id,true)
    address_mappings.each do |address_mapping|
      AddressMapping.create(address_id: address_mapping.address_id,address_type_id: address_mapping.address_type_id,active: address_mapping.active,task_id: @task.id,user_id: current_user.id)
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update_attributes(task_params)
      redirect_to tasks_path
    end
  end

  def start_data_collection_process
    redirect_to generals_path
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      if session[:task_id] == task.id
        session[:task_id] = nil
        redirect_to tasks_path
      else
        redirect_to tasks_path
      end
    end
  end

  def close_task
    session[:task_id] = nil
    session[:error] = nil
    redirect_to tasks_path
  end

  def index
    id = current_user.task_group.id
    @active_tasks = Task.where("is_submitted=true and task_group_id=?",id).all
    @inactive_tasks = Task.where("is_submitted=false and task_group_id=?",id).all

  end

  private

    def task_params
      params.require(:task).permit(:task_name)
    end

end
