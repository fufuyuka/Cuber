class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @contacts = Contact.all.order(created_at: :desc).page(params[:page])
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to edit_admin_contact_path(@contact)
    else
      render "edit"
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:memo,:supported_status)
  end
end
