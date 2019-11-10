# Preview all emails at http://localhost:3000/rails/mailers/annonce_mailer
class AnnonceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/annonce_mailer/checkout_agent_notify_admin
  def checkout_agent_notify_admin
    AnnonceMailer.checkout_agent_notify_admin
  end

end
