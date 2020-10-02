class NotesController < InheritedResources::Base
  before_action :fetch_note, only: %i[index]
  before_action :find_params, only: %i[update destroy show]



  def index 
    ransack_search = params[:q]
    @description = ransack_search[:description_cont] if ransack_search.present?   
  end

  def show

  end

  def create  
		@note = Note.new(note_params)
		@note[:created_by] = current_user.email
    if @note.save
      redirect_to approvals_path
    else
      redirect_to new_document_path
    end
  end

  def update
    if @note.update_attributes(note_params)
      redirect_to approvals_path
    end
	end
	
  def destroy
    @note.destroy
    redirect_to approvals_path
	end
	
	def delete_note
		note = Note.find_by(id: params[:id])
		note.destroy
	end


private
def find_params
  @note = Note.find(params[:id])
end

def fetch_note
  @q = Note.ransack(params[:q])
  result = @q.result
    if result.count.positive?
      @q.sorts = 'data_collection_step asc' if @q.sorts.empty?
    end
  @notes = result.paginate(:page => params[:page], per_page:10)
end

def note_params
  params.require(:note).permit(:description, :data_collection_step)
end

end
