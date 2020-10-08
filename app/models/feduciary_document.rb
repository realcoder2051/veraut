class FeduciaryDocument < ApplicationRecord
	belongs_to :task_group
	has_one_attached :feduciary_doc
end
