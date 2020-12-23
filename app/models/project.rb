class Project < ApplicationRecord
  validates :project_type,presence: true
  #has_many :project_templates
  belongs_to :project_template
  belongs_to :plan
end
