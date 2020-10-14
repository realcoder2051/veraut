class CreateContactChangeRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_change_requests do |t|
      t.date :date
      t.integer :created_by
      t.string :change_request

      t.timestamps
    end
  end
end
