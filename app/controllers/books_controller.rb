class BooksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy, :import]

  def index
    @all_books = current_user.books
  end

  def new
    @book = Book.new
  end

  def create
    puts params.inspect
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to @book
    else
      redirect_to root_path
    end
  end

  def show
    @contacts = @book.contacts
    respond_to do |format|
      format.html
      format.csv { send_data @book.to_csv }
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Updated book'
    else
      render action: 'edit'
    end
  end
  
  def import
    Book.import(params[:file])
    redirect_to redirect_to @book, notice: "People imported."
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end
  
    def book_params
      params.require(:book).permit(:title, :description, :user_id)
    end
end
