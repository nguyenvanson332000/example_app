class CommentsController < ApplicationController
    before_action :load_micropost, only: %i(create)

  def new
    # @micropost = Micropost.find(params[:micropost_id])
    @micropost = Comment.find_by(id: params[:parent_id]).micropost

    @comment = @micropost.comments.new(parent_id: params[:parent_id])
  end

  def create
    @comment = current_user.comments.build comment_params
    @comment.micropost_id = @micropost.id
    if @comment.save
      flash[:success] ="binh luan thanh cong"
      redirect_to show_path(id: @comment.micropost_id)
    else
      flash[:warning] ="binh luan that bai"
      redirect_to static_page_path params[:micropost_id]
    end
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
end
