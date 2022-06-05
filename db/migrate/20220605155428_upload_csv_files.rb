class UploadCsvFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :csv_files do |t|
      t.string :data
      t.timestamps null: false
    end
  end
end
