ActionMailer::Base.smtp_settings = {
  address: "smtp.eu.mailgun.org",
  port: 587,
  domain: 'realbeez.com',
  user_name: ENV['MAILGUN_ADDRESS'],
  password: ENV['MAILGUN_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
