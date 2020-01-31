class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :confirmation_contact]

  def new
    authorize @contact = Contact.new
  end

  def create
    authorize @contact = Contact.new(contact_params)
    if @contact.save
      # Send email to Admin
      mail = ContactMailer.with(contact: @contact).create_new_contact
      mail.deliver_now
      redirect_to confirmation_contact_path
    else
      render :new
    end
  end

  def confirmation_contact
    skip_authorization
  end

  private

  def contact_params
    params.require(:contact).permit(:nom, :prenom, :telephone, :email, :ville)
  end
end
