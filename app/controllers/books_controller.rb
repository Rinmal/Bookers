class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create

    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿が成功しました"
      redirect_to book_path(book.id)
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "アップデートが成功しました"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
