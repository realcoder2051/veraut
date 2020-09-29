class DocumentsController < InheritedResources::Base
  before_action :fetch_document, only: %i[index]
  before_action :find_params, only: %i[edit update destroy show]


  def index 
    ransack_search = params[:q]
    @name = ransack_search[:name_cont] if ransack_search.present?   
  end

  def show
    
  end

  def create  
    @document = Document.new(document_params)
    @document[:user_id] = current_user.id
    if @document.save
      redirect_to new_document_path
    else
      redirect_to new_document_path
    end
  end

  def edit

  end

  def update
    if @document.update_attributes(document_params)
      redirect_to approvals_path
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to '/approvals', :notice => "Your document has been deleted"
  end


  private
  def find_params
    @document = Document.find(params[:id])
  end

  def fetch_document
    @q = Document.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @documents = result.paginate(:page => params[:page], per_page:10)
  end

  def document_params
    params.require(:document).permit(:name, :document_type, :description, :user_id,:doc)
  end

end
