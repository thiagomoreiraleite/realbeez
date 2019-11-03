class ReviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_mailer.rating_agent.subject
  #
  def rating_agent
    @review = params[:review]

    mail(
      to:       @review.agent.user.email,
      subject:  "#{@review.user.prénom.capitalize} a publié un avis"
    )
  end
end
