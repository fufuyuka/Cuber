class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @contacts = Contact.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact.update(contact_params)
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:memo,:supported_status)
  end
end
