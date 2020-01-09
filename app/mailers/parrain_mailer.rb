class ParrainMailer < ApplicationMailer

  def parrain_notify_filleul
    @parrain = params[:parrain]

    mail(
      to:       @parrain.email,
      subject:  "#{@parrain.user.prénom.titlecase} #{@parrain.user.nom.titlecase} vous recommande les services de Realbeez pour louer votre bien immobilier à moindre cout (375 €)"
    )
  end
end
