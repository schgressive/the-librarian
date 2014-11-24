# == Schema Information
#
# Table name: books
#
#  id               :integer          not null, primary key
#  title            :string(255)      not null
#  author           :string(255)      not null
#  editorial        :string(255)      not null
#  original_title   :string(255)
#  translation      :string(255)
#  edition          :integer
#  edition_date     :date
#  edition_place    :string(255)
#  publication_year :integer
#  isbn             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  cover			:string

class Book < ActiveRecord::Base
  
  belongs_to :editorial
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :title, :author, :editorial, :presence => true
  validates :edition, :publication_year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  
  mount_uploader :cover, CoverUploader

  def editorial_name
  	self.editorial.name
  end

  def authors_names
  	authors = ""
  	cont = 0
  	self.authors.each do |author|
  		if cont > 0
  		authors += " - "
  		end
  		authors += author.name
  		cont += 1
  	end
  	return authors
  end

end