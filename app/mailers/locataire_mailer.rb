# class LocataireMailer < ApplicationMailer

#   # Subject can be set in your I18n file at config/locales/en.yml
#   # with the following lookup:
#   #
#   #   en.candidature_mailer.candidature_create_proprio.subject
#   #
#   def create_locataire_notify_agent
#     @locataire = params[:locataire]
#     mail(
#       to:       User.find(@locataire.annonce.agent_user_id.to_i).email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a déposé un dossier de location"
#     )
#   end

#   def create_locataire_notify_proprio
#     @locataire = params[:locataire]
#     mail(
#       to:       @locataire.annonce.user.email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a déposé un dossier de location"
#     )
#   end

#   def create_locataire_notify_admin
#     @locataire = params[:locataire]
#     @admin = User.where("email = ?", "contact@realbeez.com")[0]

#     mail(
#       to:       @admin.email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a déposé un dossier de location"
#     )
#   end

#   def accept_locataire_notify_agent
#     @locataire = params[:locataire]
#     mail(
#       to:       User.find(@locataire.annonce.agent_user_id.to_i).email,
#       subject:  "#{@locataire.annonce.user.prénom.capitalize} #{@locataire.annonce.user.nom.capitalize[0]}. accepte un dossier de location"
#     )
#   end

#   def accept_locataire_notify_locataire
#     @locataire = params[:locataire]
#     mail(
#       to:       @locataire.user.email,
#       subject:  "#{@locataire.annonce.user.prénom.capitalize} #{@locataire.annonce.user.nom.capitalize[0]}. accepte votre dossier de location"
#     )
#   end

#   def accept_locataire_notify_admin
#     @locataire = params[:locataire]
#     @admin = User.where("email = ?", "contact@realbeez.com")[0]

#     mail(
#       to:       @admin.email,
#       subject:  "#{@locataire.annonce.user.prénom.capitalize} #{@locataire.annonce.user.nom.capitalize} accepte un dossier de location"
#     )
#   end

#   def reject_locataire_notify_agent
#     @locataire = params[:locataire]
#     mail(
#       to:       User.find(@locataire.annonce.agent_user_id.to_i).email,
#       subject:  "#{@locataire.annonce.user.prénom.capitalize} #{@locataire.annonce.user.nom.capitalize[0]}. rejète un dossier de location"
#     )
#   end

#   def reject_locataire_notify_locataire
#     @locataire = params[:locataire]
#     mail(
#       to:       @locataire.user.email,
#       subject:  "#{@locataire.annonce.user.prénom.capitalize} #{@locataire.annonce.user.nom.capitalize[0]}. rejète votre dossier de location"
#     )
#   end

#   def reject_locataire_notify_admin
#     @locataire = params[:locataire]
#     @admin = User.where("email = ?", "contact@realbeez.com")[0]

#     mail(
#       to:       @admin.email,
#       subject:  "#{@locataire.annonce.user.prénom.capitalize} #{@locataire.annonce.user.nom.capitalize} rejète un dossier de location"
#     )
#   end

#   def update_locataire_notify_agent
#     @locataire = params[:locataire]
#     mail(
#       to:       User.find(@locataire.annonce.agent_user_id.to_i).email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a mis à jour son dossier de location"
#     )
#   end

#   def update_locataire_notify_proprio
#     @locataire = params[:locataire]
#     mail(
#       to:       @locataire.annonce.user.email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a mis à jour son dossier de location"
#     )
#   end

#   def update_locataire_notify_admin
#     @locataire = params[:locataire]
#     @admin = User.where("email = ?", "contact@realbeez.com")[0]

#     mail(
#       to:       @admin.email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a mis à jour son dossier de location"
#     )
#   end

#   def destroy_locataire_notify_agent
#     @locataire = params[:locataire]
#     mail(
#       to:       User.find(@locataire.annonce.agent_user_id.to_i).email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a supprimé son dossier de location"
#     )
#   end

#   def destroy_locataire_notify_proprio
#     @locataire = params[:locataire]
#     mail(
#       to:       @locataire.annonce.user.email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a supprimé son dossier de location"
#     )
#   end

#   def destroy_locataire_notify_admin
#     @locataire = params[:locataire]
#     @admin = User.where("email = ?", "contact@realbeez.com")[0]

#     mail(
#       to:       @admin.email,
#       subject:  "#{@locataire.prenom.capitalize} #{@locataire.nom.capitalize} a supprimé son dossier de location"
#     )
#   end

# end
