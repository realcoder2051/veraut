class QuestionaireAnswersController < InheritedResources::Base

  def new
    @questionaire_answer = QuestionaireAnswer.new
  end

  def create
  end

  def fifty_five_hundred_new
    @questionaire_answer = QuestionaireAnswer.new
  end

  def create_plan
    answers = params[:questionaire_answer][:answer]
    questionaire_answers = choose_plan(answers)
    QuestionaireAnswer.import questionaire_answers
    redirect_to plans_path
  end

  def create_fifty_five_hundred
    answers = params[:questionaire_answer][:answer]
    questionaire_answers = fifty_five_hundred_plan(answers)
    QuestionaireAnswer.import questionaire_answers
    redirect_to fifty_five_hundred_path
  end

  def edit_5500
    @questionaire_answer = QuestionaireAnswer.where('task_id=? AND question_type_id=? ',session[:task_id],2)
  end

  def update_5500
    answers = params[:questionaire_answer][:answer]
    questionaire_answers = fifty_five_hundred_plan(answers)
    QuestionaireAnswer.import questionaire_answers, on_duplicate_key_update: [:answer]
    redirect_to fifty_five_hundred_path
  end

  def edit_plan
    @questionaire_answer = QuestionaireAnswer.where('task_id=? AND question_type_id=? ',session[:task_id],1).order(:id)
  end

  def update_plan
    answers = params[:questionaire_answer][:answer]
    questionaire_answers = choose_plan(answers)
    QuestionaireAnswer.import questionaire_answers, on_duplicate_key_update: [:answer]
    redirect_to plans_path
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
  end

  private

    def questionaire_answer_params
      params.require(:questionaire_answer).permit(:answer,:question_no)
    end

    def choose_plan(answers)
     #answers = params[:questionaire_answer][:answer]
      questionaire_answers = []
      answer_id = params[:questionaire_answer][:id]
      answers.each_with_index do |answer,index|
        questionaire_answer = QuestionaireAnswer.find_or_initialize_by(id: answer_id[index].to_i.positive? ? answer_id[index].to_i : nil )
        questionaire_answer[:answer] = answer
        questionaire_answer[:task_id] = session[:task_id]
        questionaire_answer[:question_type_id] = 1
				questionaire_answer[:question_no] = index+1
        questionaire_answers << questionaire_answer
      end
      return questionaire_answers
    end

    def fifty_five_hundred_plan(answers)
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
      return questionaire_answers
    end

end
