class ContactMailer < ApplicationMailer

  def create_new_contact
    @contact = params[:contact]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    mail(
      to:       @admin.email,
      subject:  "#{@contact.prenom.capitalize} #{@contact.nom.capitalize} est intéressé par notre offre."
    )
  end

end
