class ApprovalsController < InheritedResources::Base
  before_action :fetch_document, only: %i[index]
  before_action :fetch_note, only: %i[index]

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
      redirect_to approvals_path
    end
  end

  private

  def fetch_note
    @q = Note.ransack(params[:q])
    result = @q.result
      if result.count.positive?
        @q.sorts = 'data_collection_step asc' if @q.sorts.empty?
      end
    @notes = result.paginate(:page => params[:page], per_page:10)
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
