class Task < ApplicationRecord
  belongs_to :task_group,optional: :true
  belongs_to :client
  has_many :questionaire_answers
	#has_one :questionaire_answer, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :employees,dependent: :destroy
  has_many :contacts,dependent: :destroy
end
