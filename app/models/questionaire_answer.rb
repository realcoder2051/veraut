class QuestionaireAnswer < ApplicationRecord
  belongs_to :question_type
  belongs_to :task
end
