class Project < ApplicationRecord
  #validates :name,presence: true
  has_many :project_templates
end
