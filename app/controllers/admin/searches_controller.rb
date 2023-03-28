class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @word = params[:word]
    @range = params[:range]
    if @range == "投稿"
      @posts = Post.looks(params[:search], params[:word]).page(params[:page])
    elsif @range == "コメント"
      @comments = PostComment.looks(params[:search], params[:word]).page(params[:page])
    elsif @range == "ユーザー"
      @users = User.looks(params[:search], params[:word]).page(params[:page])
    else
      @posts = PuzzleCategory.looks(params[:search], params[:word]).page(params[:page])
    end
  end
end
