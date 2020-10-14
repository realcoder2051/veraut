class AddUserToQuestionaireAnswer < ActiveRecord::Migration[6.0]
	def change
		add_reference :questionaire_answers, :user
  end
end
