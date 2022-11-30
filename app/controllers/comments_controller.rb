class CommentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(comments_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_path, notice: "Feedback was successfully created." }
        format.json { render :index, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end   

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to courses_path, status: :see_other
  end


  private
  def comments_params
    params.require(:comment).permit(:title, :descreption, :commentable_id, :commentable_type)
  end
end
