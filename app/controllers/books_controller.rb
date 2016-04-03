class BooksController < ApplicationController

# root route action
def index
	@books = Book.all.order("created_at DESC")
end

# new book
def new
	@book = Book.new
end

# create book with param
def create
	@book = Book.new(book_params)
	if @book.save
		redirect_to root_path
	else
		render 'new'
	end
end


# private functions
private

def book_params
	params.require(:book).permit(:title, :description, :author)
end

end
