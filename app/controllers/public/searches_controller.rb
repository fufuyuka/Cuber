class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @word = params[:word]
    @range = params[:range]
    if @range == "投稿"
      @posts = Post.looks(params[:search], params[:word]).page(params[:page])
    elsif @range == "ユーザー"
      @users = User.looks(params[:search], params[:word]).page(params[:page])
    else
      @posts = PuzzleCategory.looks(params[:search], params[:word]).page(params[:page])
    end
  end
end
