class CreateChangeRequestMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :change_request_mappings do |t|
      t.integer :user_id
      t.integer :task_id
      t.boolean :is_requested,default: :false
      t.integer :role_change_id
      t.references :contact_change_request

      t.timestamps
    end
  end
end
