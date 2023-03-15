class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @word = params[:word]
    @range = params[:range]

    if @range == "投稿"
      @posts = Post.looks(params[:word])
    else
      @users = User.looks(params[:word])
    end
  end
end
