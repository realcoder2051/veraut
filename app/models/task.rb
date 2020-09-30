class Task < ApplicationRecord
  belongs_to :task_group,optional:true
end
