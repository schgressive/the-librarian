class RenameBooksAuthorsToBookAuthors < ActiveRecord::Migration
  def change
  	rename_table :books_authors, :book_authors
  end
end
