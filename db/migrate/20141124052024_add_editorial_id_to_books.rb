class AddEditorialIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :editorial_id, :integer
    add_index :books, :editorial_id
  end
end
