class CreateFeduciaryDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :feduciary_documents do |t|
      t.string :plan
      t.string :feduciary_document_type
      t.string :description
      t.date :effective_date
      t.date :period_end
      t.references :task_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
