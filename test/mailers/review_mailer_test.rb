require 'test_helper'

class ReviewMailerTest < ActionMailer::TestCase
  test "rating_agent" do
    mail = ReviewMailer.rating_agent
    assert_equal "Rating agent", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
