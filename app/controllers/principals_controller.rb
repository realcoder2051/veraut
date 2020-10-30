class PrincipalsController < InheritedResources::Base
	before_action :stepper, only: %i[index]
  before_action :fetch_principal, only: %i[index]
  before_action :find_principal,only: [:edit,:update,:destroy]


  def find_principal
    @principal = Principal.find(params[:id])
  end

  def edit
  end

  def update
    if params[:principal][:name] == "" || params[:principal][:title] == "" || params[:principal][:ownership] == ""
      session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
      @principal.is_completed = false
      @principal.ownership = 0 if !@principal.ownership.present?
    end
    if @principal.update_attributes(principal_params)
			redirect_to principals_path
    else
      render :edit
    end
  end

  def create
    @principal = Principal.new(principal_params)
		@principal[:task_id] = session[:task_id]
    @principal[:user_id] = current_user.id
    if @principal.ownership == "" || @principal.name == "" || @principal.title == ""
      @principal.ownership = 0 if !@principal.ownership.present?
      session[:error] = "Your choices have been saved, however the step can not be completed because there are additional required fields."

    end
    if @principal.save
      redirect_to principals_path
    else
      render :new
    end
  end

  def index
		@notes = Note.all
		ransack_search = params[:q]
  end

  def destroy
    if @principal.update_attribute(:active, true)
      family = Family.where(related_to: @principal.id)
      family.update_all(related_to: nil)
      redirect_to principals_path
    end
	end

	def is_completed
		principals = Principal.where("is_completed=? AND user_id=? AND task_id=? AND active = ?", false , current_user.id , session[:task_id],false)
    principals.each do |principal|
      if principal.name == "" || principal.title == "" || principal.ownership.to_s == ""
      else
        principal.update(is_completed: true)
      end
    end
    principal_ownership = Principal.where("task_id = ? and is_completed = ? and active = ?",session[:task_id],true,false).pluck("ownership")
    if principal_ownership.length > 0
      result = principal_ownership.inject(0){|sum,x| sum + x }
      if result >= 100
        redirect_to families_path
      else
        session[:error] = "In order to complete this step, total Ownership must be equal to or greater than 100 %"
        redirect_to principals_path
      end
    else
      session[:error] = "In order to complete this step, total Ownership must be equal to or greater than 100 %"
      redirect_to principals_path
    end
	end

	private
	def fetch_principal
    @q = Principal.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @principals = result.paginate(:page => params[:page], per_page:10).order('officer ASC').where("task_id =? and active = ?",session[:task_id],false)
  end

	def principal_params
		params.require(:principal).permit(:name, :title, :officer, :ownership)
	end

end
