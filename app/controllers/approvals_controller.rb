class ApprovalsController < InheritedResources::Base
  before_action :fetch_document, only: %i[index]
	before_action :fetch_note, only: %i[index]
	before_action :stepper, only: %i[index]

  def index
    @approvals = Approval.all.order('created_at')
		@approval = Approval.new
	end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to approvals_path
  end

  def send_email
    name = params[:name]
    title = params[:title]
    phone = params[:phone]
    email = params[:email]
    if UserMailer.welcome_email(name,title,phone,email).deliver
      task = Task.find(session[:task_id])
      task.update(is_submitted: true)
      session[:task_id] = nil
      session[:error] = nil
      redirect_to tasks_path
    else
      redirect_to tasks_path
    end
  end

  private

  def fetch_note
    @q =  Note.where("created_by=? AND task_id=?" , current_user.email, session[:task_id]).ransack(params[:q])
    result = @q.result
      if result.count.positive?
        @q.sorts = 'created_at' if @q.sorts.empty?
      end
    @notes = result.paginate(:page => params[:page], per_page:10).order('created_at desc')
  end

  def fetch_document
    @q = Document.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @documents = result.paginate(:page => params[:page], per_page:10)
  end

  def approval_params
    params.require(:approval).permit(:date, :status, :user_id)
  end

end
