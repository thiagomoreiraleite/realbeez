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
end
