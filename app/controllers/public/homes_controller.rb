class Public::HomesController < ApplicationController
  
  def top
    @popular_posts = Post.where(status: "active").includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}.first(5)
    @new_posts = Post.where(status: "active").order(created_at: :desc).first(5)
  end
  
  def search
    @word = params[:word]
    @posts = Post.looks(params[:search], params[:word]).first(5) if @word.present?
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_completion_path
    else
      render 'new'
    end
  end
  
  private

  def contact_params
    params.require(:contact).permit(:name,:email,:contact_detail)
  end
end
