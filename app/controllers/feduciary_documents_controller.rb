class FeduciaryDocumentsController < InheritedResources::Base
	before_action :fetch_document, only: %i[index]
  before_action :find_params, only: %i[edit update destroy show]

  def index
    ransack_search = params[:q]
    @name = ransack_search[:name_cont] if ransack_search.present?
  end

  def show
  end

	def create
    @feduciary_document = FeduciaryDocument.new(feduciary_document_params)
    @feduciary_document[:task_group_id] = current_user.task_group.id
    status = check_file_format_supported?(@feduciary_document)
    if status && @feduciary_document.save
      flash[:notice] = "File Upload Successfully"
      redirect_to feduciary_documents_path
    else
      flash.now.alert = "File Format Not Supported except pdf"
      render new_feduciary_document_path
    end
  end

	def edit
  end

  def update
    filename = feduciary_document_params["feduciary_doc"].original_filename
    status =  filename.last(4).include?(".pdf") if filename.present?
    if status && @feduciary_document.update_attributes(feduciary_document_params)
      flash[:notice] = "File Upload Successfully"
      redirect_to feduciary_documents_path
    else
      flash.now.alert = "File Format Not Supported except pdf"
      render :edit
    end
  end

  def check_file_format_supported?(feduciary_document)
    if feduciary_document.feduciary_doc.present?
      if feduciary_document.feduciary_doc.filename.extension == "pdf"
        return true
      else
        return false
      end
    else
      return false
    end
  end


  def destroy
    feduciary_document = FeduciaryDocument.find(params[:id])
    feduciary_document.destroy
    redirect_to '/feduciary_documents', :notice => "Your document has been deleted"
  end


  private
  def find_params
    @feduciary_document = FeduciaryDocument.find(params[:id])
  end

  def fetch_document
    @q = FeduciaryDocument.ransack(params[:q])
    result = @q.result
     if result.count.positive?
       @q.sorts = 'name asc' if @q.sorts.empty?
     end
    @feduciary_documents = result.paginate(:page => params[:page], per_page:10)
  end
  private

	def feduciary_document_params
		params.require(:feduciary_document).permit(:plan, :feduciary_document_type, :description, :effective_date, :period_end, :task_group_id, :feduciary_doc)
	end

end
