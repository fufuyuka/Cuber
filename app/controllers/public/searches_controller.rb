class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @word = params[:word]
    @range = params[:range]
    if @range == "投稿"
      @posts = Post.looks(params[:word])
    elsif @range == "ユーザー"
      @users = User.looks(params[:word])
    else
      @posts = PuzzleCategory.looks(params[:word])
    end
  end
end
