# Preview all emails at http://localhost:3000/rails/mailers/page_mailer
class PageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/page_mailer/contactez_nous
  def contactez_nous
    PageMailer.contactez_nous
  end

end
