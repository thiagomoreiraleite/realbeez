# Preview all emails at http://localhost:3000/rails/mailers/candidature_mailer
class CandidatureMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/candidature_mailer/candidature_create_proprio
  def candidature_create_proprio
    CandidatureMailer.candidature_create_proprio
  end

end
