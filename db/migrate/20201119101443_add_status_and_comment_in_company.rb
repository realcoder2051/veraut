class AddStatusAndCommentInCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies,:status, :boolean, default: false
    add_column :companies,:comments, :string

  end
end
