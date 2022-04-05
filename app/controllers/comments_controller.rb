class CommentsController < ApplicationController
  before_action :load_micropost, only: %i(create)
  before_action :load_comment, only: %i(edit update destroy)

  def new
    # @micropost = Micropost.find(params[:micropost_id])
    @micropost = Comment.find_by(id: params[:parent_id]).micropost
    @comment = @micropost.comments.new(parent_id: params[:parent_id])
  end

  def create
    @comment = current_user.comments.build comment_params
    @comment.micropost_id = @micropost.id
    if @comment.save
      flash[:success] = "binh luan thanh cong"
      redirect_to show_path(id: @comment.micropost_id)
    else
      flash[:warning] = "binh luan that bai"
      redirect_to static_page_path params[:micropost_id]
    end
  end

  def edit
    @comment = Comment.find_by id: params[:id]
  end

  def update
    if @comment.update comment_params
      flash[:success] = "chinh sua comment thanh cong"
      redirect_to show_path(id: @comment.micropost_id)
    else
      flash.now[:warning] = "chinh sua that bai"
      render :edit
    end
  end

  def destroy
    if @comment&.destroy
      flash[:success] = "Xoa thanh cong"
    else
      flash[:danger] = "xoa that bai"
    end
    redirect_to show_path(id: @comment.micropost_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end

  def load_micropost
    @micropost = Micropost.find_by(id: params[:comment][:micropost_id])
    return if @micropost

    flash[:warning] = "k tim thay micropost"
    redirect_to root_path
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment

    flash[:warning] = t "khong tim thay id comment"
    redirect_to root_path
  end
end
