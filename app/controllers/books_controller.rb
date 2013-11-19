class BooksController < ApplicationController
	def index 
		@books = Book.all
	end
	def create
		@book = Book.new( book_params )
		if @book.save
			redirect_to books_path
		else
			redirect_to new_book_path
		end
	end
	def new
		@book = Book.new
	end

	private
		def book_params
			params.require(:book).permit(:name)
		end
end
