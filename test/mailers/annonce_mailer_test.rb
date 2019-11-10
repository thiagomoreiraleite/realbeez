require 'test_helper'

class AnnonceMailerTest < ActionMailer::TestCase
  test "checkout_agent_notify_admin" do
    mail = AnnonceMailer.checkout_agent_notify_admin
    assert_equal "Checkout agent notify admin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
