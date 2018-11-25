class UsersController < ApplicationController
	before_action :authenticate_user!

  def new

  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
 	@book = Book.new

  end

  def index
  	@users = User.all
  	@user = current_user
  	@book = Book.new
  end

  def create
  	@user = User.new
    @user.save
  end

  def edit
 	@book = Book.new
  	@books = Book.all.order(created_at: :asc)
  	@user = current_user
  end

  def update
  	@user = User.find(params[:id])

  	if  @user.update(user_params)
  		flash[:notice] = "successfully! 投稿を更新しました"
  		redirect_to user_path(@user)
  	else
  		render :edit
  	end
  end


private
  def user_params
    params.require(:user).permit(:image, :name, :introduction)
  end

end


