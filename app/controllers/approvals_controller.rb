class ApprovalsController < InheritedResources::Base
  before_action :fetch_document, only: %i[index]


  def index
    @approvals = Approval.all.order('created_at')
    @approval = Approval.new
  end

  def destroy

  end



  private

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
