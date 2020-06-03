class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destory]

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path , notice: 'Book was successfully created'
    else 
      @books = Book.all
      flash[:alert] = @book.errors.full_messages
      render "index"
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_path , notice: 'Book was successfully updated'
    else 
      flash[:alert] = @book.errors.full_messages
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id]) #$B%G!<%?(B($B%l%3!<%I(B)$B$r(B1$B7o<hF@(B
    book.destroy #$B%G!<%?!J%l%3!<%I!K$r:o=|(B
    redirect_to books_path, notice: 'Book was successfully deleted.'
  end  

  
  private

  def set_book
    @book = Book.find params[:id]
  end
   
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
