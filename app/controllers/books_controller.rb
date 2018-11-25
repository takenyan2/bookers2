class BooksController < ApplicationController
  before_action :authenticate_user!
  def top
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @user = current_user
     @book = Book.new
    @books = Book.all
  end

  def new
  end

  def create
  	@book = Book.new(books_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if  @book.save
        flash[:notice] = "successfully! 投稿しました"
        redirect_to book_path(@book.id)
    else
        render :index
    end
  end

  def update
    @book = Book.find(params[:id])

    if  @book.update(books_params)
        flash[:notice] = "successfully! 保存しました"
        redirect_to book_path(@book.id)
    else
        render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
       redirect_to books_path
    end
  end

  private
  def books_params
    params.require(:book).permit(:title, :opinion)
  end

end
