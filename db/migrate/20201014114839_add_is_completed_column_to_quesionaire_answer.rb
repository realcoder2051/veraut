class AddIsCompletedColumnToQuesionaireAnswer < ActiveRecord::Migration[6.0]
	def change
		add_column :questionaire_answers, :is_completed, :boolean, default: false
  end
end
