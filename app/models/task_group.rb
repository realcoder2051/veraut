class TaskGroup < ApplicationRecord
  has_many :tasks
	belongs_to :user
	has_many :feduciary_documents
end
