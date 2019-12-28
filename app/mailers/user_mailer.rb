class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Bienvenue chez Realbeez')
    # This will render a view in `app/views/user_mailer`!
  end

  # def new_registration
  #   @user = params[:user]
  #   @admin = User.where("email = ?", "contact@realbeez.com")[0]

  #   mail(
  #     to: @admin.email,
  #     subject: "#{@user.prénom.capitalize} s'est inscrit sur Realbeez"
  #   )
  # end

  # def delete_account
  #   @admin = User.where("email = ?", "contact@realbeez.com")[0]

  #   mail(
  #     to: @admin.email,
  #     subject: "Un compte a été supprimé, check les photos par défaut"
  #   )
  # end

end
