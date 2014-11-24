class MoveAuthorsDataToAuthors < ActiveRecord::Migration
  def change
  	Book.find_each do |book|
		q = Author.where("authors.name = ?", book.author)
		ba = BooksAuthors.new
		if q.blank?
			a = Author.new
			a.name = book.author
			a.save!
			
			ba.book_id = book.id
			ba.author_id = a.id
		else
			ba.book_id = book.id
			ba.author_id = q.first.id
		end
		ba.save!
	end
  end
end
