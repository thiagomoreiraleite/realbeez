require 'test_helper'

class CandidatureMailerTest < ActionMailer::TestCase
  test "candidature_create_proprio" do
    mail = CandidatureMailer.candidature_create_proprio
    assert_equal "Candidature create proprio", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
