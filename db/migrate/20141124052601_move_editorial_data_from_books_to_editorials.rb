class MoveEditorialDataFromBooksToEditorials < ActiveRecord::Migration
  def change
	Book.find_each do |book|
		q = Editorial.where("editorials.name = ?", book.editorial)  
		if q.blank?
			e = Editorial.new
			e.name = book.editorial
			e.save!
			book.editorial_id = e.id 
		else
			book.editorial_id = q.first.id
		end
		book.save!
	end

  end
end
