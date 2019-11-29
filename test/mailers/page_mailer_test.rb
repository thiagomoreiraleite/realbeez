require 'test_helper'

class PageMailerTest < ActionMailer::TestCase
  test "contactez_nous" do
    mail = PageMailer.contactez_nous
    assert_equal "Contactez nous", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
