class BusinessesController < ApplicationController
	before_action :stepper, only: [:index,:is_completed]
	before_action :fetch_business, only: %i[index]
	before_action :find_business,only: [:show,:edit,:update,:destroy]
	before_action :find_task,only: %i[is_completed update create destroy]

	def find_task
		@task = Task.find(session[:task_id])
	end

	def find_business
		@business = Business.find(params[:id])
	end

  def new
    @business = Business.new
	end

  def edit
	end

	def update
		@business.is_completed = false
		if @business.update_attributes(business_params)
			@task.steppers["business"] = false
			@task.save
			redirect_to businesses_path
		else
			render :edit
    end
  end

	def index
	  ransack_search = params[:q]
		@notes = Note.all
  end

  def create
  	@business = Business.new(business_params)
		@business[:task_id] = session[:task_id]
		@business[:user_id] = current_user.id
		if @business.save
			@task.steppers["business"] = false
			@task.save
			redirect_to businesses_path
		else
			render :new
		end
	end

	def is_completed
		status = true
		businesses = Business.where("is_completed=? AND user_id=? AND task_id=? AND active = ?", false , current_user.id , session[:task_id],false)
		if businesses.length == 0
			@task.steppers["business"] = true
			@task.save
		else
			businesses.each do |business|
				if business.name == "" || business.ein.to_s.length != 9  || business.does_company_have_employees == "" || business.qualified_plan_sponsored == "" || business.entity_type == ""
					@task.steppers["business"] = false
					@task.save
					status = false
				else
					business.update(is_completed: true)
					@task.steppers["business"] = true
					@task.save
				end
			end
		end
		if status
			redirect_to contacts_path
		else
			redirect_to businesses_path
		end
	end

	def destroy
		if @business.update_attribute(:active, true)
			@task.steppers["business"] = false
			@task.save
			redirect_to businesses_path
		end
  end

	private

	def fetch_business
    @q = Business.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @businesses = result.paginate(:page => params[:page], per_page:10).order('created_at').where("task_id = ? and active =?", session[:task_id],false)
  end

	def business_params
		params.require(:business).permit(:name, :ein, :date_purchased_or_sold, :address, :city, :state, :zip, :phone,:does_company_have_employees, :qualified_plan_sponsored, :entity_type)
	end

end
