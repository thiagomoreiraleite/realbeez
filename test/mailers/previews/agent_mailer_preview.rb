# Preview all emails at http://localhost:3000/rails/mailers/agent_mailer
class AgentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/agent_mailer/candidature_become_agent_RB
  def candidature_become_agent_RB
    AgentMailer.candidature_become_agent_RB
  end

end
