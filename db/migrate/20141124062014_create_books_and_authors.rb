class CreateBooksAndAuthors < ActiveRecord::Migration
  def change
    create_table :books_authors, id: false do |t|
      t.belongs_to :book
      t.belongs_to :author
    end
  end
end
