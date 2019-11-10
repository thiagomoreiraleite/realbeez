# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/checkout_proprio_notify_admin
  def checkout_proprio_notify_admin
    OrderMailer.checkout_proprio_notify_admin
  end

end
