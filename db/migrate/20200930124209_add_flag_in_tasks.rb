class AddFlagInTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks,:flag,:boolean,default: false
  end
end
