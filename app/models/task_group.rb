class TaskGroup < ApplicationRecord
  has_many :tasks,dependent: :destroy
	belongs_to :user
	has_many :feduciary_documents
end
