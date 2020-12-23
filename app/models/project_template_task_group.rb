class ProjectTemplateTaskGroup < ApplicationRecord
  belongs_to :project_template
  validates :name,presence: true
  has_many :project_tasks,dependent: :destroy
end
