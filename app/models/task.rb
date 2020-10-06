class Task < ApplicationRecord
  belongs_to :task_group,optional:true
  has_many :questionaire_answers
  has_one :questionaire_answer
end
