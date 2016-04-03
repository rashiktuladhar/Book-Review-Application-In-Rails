class BooksController < ApplicationController


# do this before calling any action below (need to call the action find book within private area for only the 4 operation mentioned before calling index and other action)
before_action :find_book, only: [:show, :edit, :update, :destroy]


# root route action
def index
	@books = Book.all.order("created_at DESC")
end


# show book details
def show
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


def edit
end

def update
	if @book.update(book_params)
		redirect_to book_path(@book)
	else
		render 'edit'
	end
end

def destroy
end



# private functions
private


# available books parameters to add and update
def book_params
	params.require(:book).permit(:title, :description, :author)
end


# params for getting the id of the book for DRY (delete, update and show)
def find_book
	@book = Book.find(params[:id])
end




end
