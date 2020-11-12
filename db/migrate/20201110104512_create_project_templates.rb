class CreateProjectTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :project_templates do |t|
      t.references :project
      t.date :start_date
      t.date :external_deadline
      t.boolean :require_web_collection

      t.timestamps
    end
  end
end
