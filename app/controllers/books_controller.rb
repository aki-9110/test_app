class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def autocomplete
    @books = Book.where("title like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end
end
