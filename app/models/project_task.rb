class ProjectTask < ApplicationRecord
  belongs_to :project_template_task_group
  validates :name,presence:true
  belongs_to :bei_employee,optional: true
  belongs_to :project_template
end
