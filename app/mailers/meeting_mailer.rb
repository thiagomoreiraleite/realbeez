class MeetingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.meeting_mailer.visit_agent.subject
  #
  def visit_agent
    @meeting = params[:meeting]

    mail(
      to:       @meeting.annonce.user.email,
      subject:  "#{@meeting.user.prénom.capitalize} a prévu une visite"
    )
  end

  def visit_agent_notify_admin
    @meeting = params[:meeting]
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    mail(
      to:       @admin.email,
      subject:  "#{@meeting.user.prénom.capitalize} a prévu une visite"
    )
  end
end
