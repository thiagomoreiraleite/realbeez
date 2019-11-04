require 'test_helper'

class ConversationMailerTest < ActionMailer::TestCase
  test "create_conversation" do
    mail = ConversationMailer.create_conversation
    assert_equal "Create conversation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
