class Public::HomesController < ApplicationController
  def top
  end
  
  def search
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
