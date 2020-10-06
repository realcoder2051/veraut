class CreateQuestionaireAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :questionaire_answers do |t|
      t.string :answer
      t.string :question_no
      t.references :task
      t.references :question_type

      t.timestamps
    end
  end
end
