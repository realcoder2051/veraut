class QuestionaireAnswersController < InheritedResources::Base

  def new
    @questionaire_answer = QuestionaireAnswer.new
  end

  def create
    # questionaire_answer = QuestionaireAnswer.new(questionaire_answer_params)
    # questionaire_answer[:task_id] = session[:task_id]
    # if request.fullpath == "/plans"
    #   questionaire_answer[:question_type_id] = 1
    # else
    #   questionaire_answer[:question_type_id] = 2
    # end

    # if questionaire_answer.save
    #   redirect_to plans_path
    # end
  end

  def fifty_five_hundred_new
    @questionaire_answer = QuestionaireAnswer.new
  end

  def create_plan
    choose_plan
  end

  def create_fifty_five_hundred
    fifty_five_hundred_plan
  end

  def edit_5500
    @questionaire_answer = QuestionaireAnswer.joins(task: :task_group).where('task_groups.user_id=? AND question_type_id=?',current_user.id,2)
  end

  def update_5500
    fifty_five_hundred_plan
  end

  def edit_plan
    @questionaire_answer = QuestionaireAnswer.joins(task: :task_group).where('task_groups.user_id=? AND question_type_id=? ',current_user.id,1)
  end

  def update_plan
    choose_plan
  end

  def show
    @questionaire_answer = QuestionaireAnswer.find(params[:id])
  end

  def index_plan
    id = session[:task_id]
    @questionaire_answers = QuestionaireAnswer.order('created_at').where(task_id: id, question_type_id: 1).all
  end

  def index_fifty_five_hundred
    id = session[:task_id]
    @questionaire_answers = QuestionaireAnswer.order('created_at').where(task_id: id, question_type_id: 2).all
  end

  def index
    @questionaire_answers = QuestionaireAnswer.all.order('created_at').where(task_id: session[:task_id])
  end

  private

    def questionaire_answer_params
      params.require(:questionaire_answer).permit(:answer,:question_no)
    end

    def choose_plan
      answers = params[:questionaire_answer][:answer]
      questionaire_answers = []
      id = params[:questionaire_answer][:id]
      answers.each_with_index do |answer,index|
        questionaire_answer = QuestionaireAnswer.find_or_initialize_by(id: id[index].to_i.positive? ? id[index].to_i : nil )
        questionaire_answer[:answer] = answer
        questionaire_answer[:task_id] = session[:task_id]
        questionaire_answer[:question_type_id] = 1
				questionaire_answer[:question_no] = index+1
        questionaire_answers << questionaire_answer
      end
      QuestionaireAnswer.import questionaire_answers, on_duplicate_key_update: [:answer]
      redirect_to plans_path
    end

    def fifty_five_hundred_plan
      answers = params[:questionaire_answer][:answer]
      questionaire_answers = []
      id = params[:questionaire_answer][:id]
      answers.each_with_index do |answer,index|
        questionaire_answer = QuestionaireAnswer.find_or_initialize_by(id: id[index].to_i.positive? ? id[index].to_i : nil )
        questionaire_answer[:answer] = answer
        questionaire_answer[:task_id] = session[:task_id]
				questionaire_answer[:question_type_id] = 2
        questionaire_answer[:question_no] = index+1
        questionaire_answers << questionaire_answer
      end
      QuestionaireAnswer.import questionaire_answers, on_duplicate_key_update: [:answer]
    redirect_to fifty_five_hundred_path
    end

end
