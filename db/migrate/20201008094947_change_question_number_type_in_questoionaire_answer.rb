class ChangeQuestionNumberTypeInQuestoionaireAnswer < ActiveRecord::Migration[6.0]

  def up
    add_column :questionaire_answers,:question_no,:integer
  end

  def down
    remove_column :questionaire_answers,:question_no,:string
  end

end
