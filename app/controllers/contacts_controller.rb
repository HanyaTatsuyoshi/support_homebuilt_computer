class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:notice] = "お問い合わせ内容が送信されました。"
      redirect_to new_contact_path
    else
      render new_contact_path
    end
  end
  
  private
    
    def contact_params
      params.require(:contact).permit(:name, :contact_information, :message)
    end
end
