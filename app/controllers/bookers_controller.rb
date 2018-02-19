class BookersController < ApplicationController

  def top
  end

  def index
  	@post = Booker.all
    @newpost = Booker.new
  end

  def show
  	@post = Booker.find(params[:id])
  end

  def create
  	newpost = Booker.new(post_params)
  	newpost.save
  	redirect_to booker_path(newpost.id)
  end

  def edit
  	@post = Booker.find(params[:id])
  end

  def update
  	post = Booker.find(params[:id])
  	post.update(post_params)
  	redirect_to booker_path
  end

  def destroy
  	post = Booker.find(params[:id])
  	post.destroy
  	redirect_to bookers_path, notice: '削除しました'
  end

  private
  def post_params
  	params.require(:booker).permit(:title, :impression, :name)
  end

end
