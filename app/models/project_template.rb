class ProjectTemplate < ApplicationRecord
  validates :name,presence: true
  has_many :projects,dependent: :destroy
  has_many :project_template_task_groups,dependent: :destroy
  has_many :project_tasks,dependent: :destroy
end
