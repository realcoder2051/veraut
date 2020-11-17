class NotesController < InheritedResources::Base
  before_action :fetch_note, only: %i[index]
  before_action :find_params, only: %i[update destroy show update_note edit]



  def index 
    ransack_search = params[:q]
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
		data_collection = Note.where("id =?", params[:id]).pluck(:data_collection_step).first
		if note.destroy
			count = get_note_count(data_collection)
			render json: {
				note_count: count
		}
		end
	end

	def create_note
		@note = Note.new(note_params)
		@note.created_by = current_user.email
		@note[:task_id] = session[:task_id]
		if @note.save
			count = get_note_count(note_params[:data_collection_step])
			render json: {
					html: render_to_string(partial: '/notes/note.html.erb', locals: { note: @note }),
					note_count: count
			}
		end
	end

	def get_note_count(data_collection_step)
		notes = Note.where("data_collection_step =? AND task_id =?" , data_collection_step , session[:task_id]).count
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
				@q.sorts = 'created_at' if @q.sorts.empty?
			end
		@notes = result.paginate(:page => params[:page], per_page:2)
	end

	def note_params
		params.require(:note).permit(:description, :data_collection_step)
	end

end
