class NotesController < InheritedResources::Base
  before_action :fetch_note, only: %i[index]
  before_action :find_params, only: %i[update destroy show update_note edit]



  def index 
    ransack_search = params[:q]
    @description = ransack_search[:description_cont] if ransack_search.present?   
  end

  def show

	end
	
	def edit 
		
	end

  def create  
		@note = Note.new(note_params)
		@note[:created_by] = current_user.email
		@note[:task_id] = session[:task_id]
    if @note.save
      redirect_to approvals_path
    else
      redirect_to approvals_path
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

	def create_note
		@note = Note.new(note_params)
		@note.created_by = current_user.email
		@note[:task_id] = session[:task_id]
		if @note.save
			render json: {
					html: render_to_string(partial: '/notes/note.html.erb', locals: { note: @note })
			}
		end
	end

	def get_note
		note = Note.find_by(id: params[:id])
		render json: { data: note }
	end

	def update_note
		if @note.update_attributes(note_params)
			render json: {
					html: render_to_string(partial: '/notes/note.html.erb', locals: { note: @note })
			}
		end
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
  @notes = result.paginate(:page => params[:page], per_page:2)
end

def note_params
  params.require(:note).permit(:description, :data_collection_step)
end

end
