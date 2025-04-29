class BooksController < ApplicationController
  before_action :book_params, only: [ :create ]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, success: "投稿に成功"
    else
      flash[:alert] = "投稿に失敗"
      render :new, status: :unprocessable_entity
    end
  end

  def autocomplete
    @books = Book.where("title like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
