require 'test_helper'

class AgentMailerTest < ActionMailer::TestCase
  test "candidature_become_agent_RB" do
    mail = AgentMailer.candidature_become_agent_RB
    assert_equal "Candidature become agent rb", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
