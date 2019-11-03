require 'test_helper'

class MeetingMailerTest < ActionMailer::TestCase
  test "visit_agent" do
    mail = MeetingMailer.visit_agent
    assert_equal "Visit agent", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
