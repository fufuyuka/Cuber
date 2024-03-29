class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @post = Post.find(params[:id])
    @new_comment = PostComment.new
    @comments = @post.post_comments.page(params[:page])
  end
  
  def create
    @new_post = Post.new(post_params)
    #find_or_create_by=存在すれば使うなければ作る(or_create)
    @new_post.user_id = current_user.id
    if params[:post][:category].present? && @new_post.valid? # .valid?は@new_postのバリデーションに問題がないときtureを返す
      @new_post.puzzle_category = PuzzleCategory.find_or_create_by(category: params[:post][:category])
    end
    # 保存に失敗したら
    unless @new_post.save
      @posts = Post.where(status: 0).order(created_at: :desc).page(params[:page])
      render 'index'
      return
    end
    redirect_to post_path(@new_post)
  end

  def index
    @new_post = Post.new
    @posts = Post.where(status: 0).order(created_at: :desc).page(params[:page])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.update(status: "deletion") #ステータス変更
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:statement)
  end
end
