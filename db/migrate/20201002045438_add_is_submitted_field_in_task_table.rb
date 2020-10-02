class AddIsSubmittedFieldInTaskTable < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks,:is_submitted,:boolean,default: false
  end
end
