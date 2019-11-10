require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "checkout_proprio_notify_admin" do
    mail = OrderMailer.checkout_proprio_notify_admin
    assert_equal "Checkout proprio notify admin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
