class QuestionaireAnswersController < InheritedResources::Base
	before_action :stepper, only: %i[fifty_five_hundred_new new edit_plan edit_5500 create_plan create_fifty_five_hundred]

	def new
		@flash_action = true
		@notes = Note.all
		@questionaire_answer = QuestionaireAnswer.new
		if QuestionaireAnswer.exists?(task_id: session[:task_id], user_id: current_user.id, question_type_id: 1)
			@questionaire_answer = QuestionaireAnswer.find_by(task_id: session[:task_id])	
			if QuestionaireAnswer.where("task_id=? AND answer=? AND question_type_id=?", session[:task_id] , "", 1).present?
				flash[:alert]= "Your choices have been saved, however the step can not be completed because there are additional required fields."
				redirect_to edit_plan_path(@questionaire_answer)
			else
				flash[:notice] = "Successfully completed"
				redirect_to edit_plan_path(@questionaire_answer)
			end
	 end
  end

  def create
  end

	def fifty_five_hundred_new
		@flash_action = true
		@notes = Note.all
		@questionaire_answer = QuestionaireAnswer.new
		if QuestionaireAnswer.exists?(task_id: session[:task_id], user_id: current_user.id, question_type_id: 2)
			@questionaire_answer = QuestionaireAnswer.find_by(task_id: session[:task_id])	
			question = QuestionaireAnswer.where("task_id=? AND question_type_id=?", session[:task_id] , 2)
			if QuestionaireAnswer.where("task_id=? AND answer=? AND question_type_id=?", session[:task_id] , "", 2).present?
				if question.third.answer == "No" && question.fourth.answer == ""
					flash[:notice] = "Successfully completed"
					redirect_to edit_fifty_five_hundred_path(@questionaire_answer)
				else
					flash[:alert]= "Your choices have been saved, however the step can not be completed because there are additional required fields."
					redirect_to edit_fifty_five_hundred_path(@questionaire_answer)
				end
			else
				flash[:notice] = "Successfully completed"
				redirect_to edit_fifty_five_hundred_path(@questionaire_answer)
			end
	 end
  end

  def create_plan
    questionaire_answers = choose_plan
		QuestionaireAnswer.import questionaire_answers
		is_completed_plan
  end

  def create_fifty_five_hundred
    questionaire_answers = fifty_five_hundred_plan
		QuestionaireAnswer.import questionaire_answers
		is_completed_fifty_five_hundred
  end

	def edit_5500
		@flash_action = true
		@notes = Note.all
    @questionaire_answer = QuestionaireAnswer.where('task_id=? AND question_type_id=? ',session[:task_id],2)
  end

  def update_5500
    questionaire_answers = fifty_five_hundred_plan
		QuestionaireAnswer.import questionaire_answers, on_duplicate_key_update: [:answer]
		question = QuestionaireAnswer.where("task_id=? AND question_type_id=?", session[:task_id] , 2)
		if QuestionaireAnswer.where("task_id=? AND answer=? AND question_type_id=?", session[:task_id] , "", 2).present?
			if question.third.answer == "No" && question.fourth.answer == ""
				flash[:notice] = "Successfully completed"
				redirect_to edit_fifty_five_hundred_path
			else
				flash[:alert]= "Your choices have been saved, however the step can not be completed because there are additional required fields."
				redirect_to edit_fifty_five_hundred_path
			end
		else
			flash[:notice] = "Successfully completed"
			redirect_to edit_fifty_five_hundred_path
		end
  end

	def edit_plan
		@flash_action = true
		@notes = Note.all
    @questionaire_answer = QuestionaireAnswer.where('task_id=? AND question_type_id=? ',session[:task_id],1).order(:id)
  end

  def update_plan
    questionaire_answers = choose_plan
    QuestionaireAnswer.import questionaire_answers, on_duplicate_key_update: [:answer]
		if QuestionaireAnswer.where("task_id=? AND answer=? AND question_type_id=?", session[:task_id] , "", 1).present?
			flash[:alert] = "Your choices have been saved, however the step can not be completed because there are additional required fields."
			redirect_to edit_plan_path
		else
			flash[:notice] = "Successfully completed"
			redirect_to edit_plan_path
		end
	end

  def show
    @questionaire_answer = QuestionaireAnswer.find(params[:id])
  end

  def index_plan
    id = session[:task_id]
    @questionaire_answers = QuestionaireAnswer.where("task_id=? AND question_type_id=?" ,id , 1).order(:id)
  end

  def index_fifty_five_hundred
    task_id = session[:task_id]
    @questionaire_answers = QuestionaireAnswer.where("task_id=? AND question_type_id=?" ,task_id , 2).order(:id)
		@questionaire_answers = QuestionaireAnswer.order('created_at').where(task_id: id, question_type_id: 1).all
		@notes = Note.all
  end

  def index_fifty_five_hundred
    id = session[:task_id]
		@questionaire_answers = QuestionaireAnswer.order('created_at').where(task_id: id, question_type_id: 2).all
	end

	def is_completed_fifty_five_hundred
		question_answer = QuestionaireAnswer.where("is_completed=? AND user_id=? AND task_id=? AND question_type_id=?", false , current_user.id , session[:task_id], 2)
		question_answer.update(is_completed: true)
    redirect_to fifty_five_hundred_new_path
	end

	def is_completed_plan
		question_answer = QuestionaireAnswer.where("is_completed=? AND user_id=? AND task_id=? AND question_type_id=?", false , current_user.id , session[:task_id], 1)
		question_answer.update(is_completed: true)
    redirect_to plans_new_path
	end

  private

    def questionaire_answer_params
      params.require(:questionaire_answer).permit(:answer,:question_no)
    end

    def choose_plan
     answers = params[:questionaire_answer][:answer][0].permit!.to_h
      questionaire_answers = []
      answer_id = params[:questionaire_answer][:id]
			answers.each do |indx,val|
				index = indx.to_i
        questionaire_answer = QuestionaireAnswer.find_or_initialize_by(id: answer_id[index].to_i.positive? ? answer_id[index].to_i : nil )
        questionaire_answer[:answer] = val
				questionaire_answer[:task_id] = session[:task_id]
				questionaire_answer[:user_id] = current_user.id
        questionaire_answer[:question_type_id] = 1
				questionaire_answer[:question_no] = index+1
        questionaire_answers << questionaire_answer
      end
      return questionaire_answers
    end

    def fifty_five_hundred_plan
      answers = params[:questionaire_answer][:answer][0].permit!.to_h
      questionaire_answers = []
      id = params[:questionaire_answer][:id]
			answers.each do |indx, val|
				index = indx.to_i
        questionaire_answer = QuestionaireAnswer.find_or_initialize_by(id: id[index].to_i.positive? ? id[index].to_i : nil )
        questionaire_answer[:answer] = val
				questionaire_answer[:task_id] = session[:task_id]
				questionaire_answer[:user_id] = current_user.id
				questionaire_answer[:question_type_id] = 2
        questionaire_answer[:question_no] = index+1
        questionaire_answers << questionaire_answer
      end
      return questionaire_answers
    end

end
