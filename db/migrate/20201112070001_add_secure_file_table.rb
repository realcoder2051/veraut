class AddSecureFileTable < ActiveRecord::Migration[6.0]
  def change
    create_table :secure_files do |t|
      t.string :file_name
      t.timestamps
    end
  end
end
