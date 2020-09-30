class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :description
      t.string :data_collection_step
      t.string :created_by

      t.timestamps
    end
  end
end
