class StaticPagesController < ApplicationController
  before_action :load_micropost, only: :show

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate page: params[:page]
    end
  end

  def show
    @comments = @micropost.comments.newest
    @comment = Comment.new
  end

  def help
  end

  def about
  end

  private

  def load_micropost
    @micropost = Micropost.find_by(id: params[:id])
    return if @micropost

    flash[:warning] = "k tim thay micropost"
    redirect_to root_path
  end
end
