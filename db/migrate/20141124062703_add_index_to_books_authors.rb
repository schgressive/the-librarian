class AddIndexToBooksAuthors < ActiveRecord::Migration
  def change
  	add_index :books_authors, [:book_id, :author_id]
  end
end
