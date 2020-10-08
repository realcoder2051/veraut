class ChangeQuestionNumberTypeInQuestoionaireAnswer < ActiveRecord::Migration[6.0]

  def up
    change_column :questionaire_answers,:question_no,'integer USING CAST(question_no AS integer)'
  end

end
