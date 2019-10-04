class OrdersController < ApplicationController

  def create
    authorize annonce = Annonce.find(params[:annonce_id])
    authorize order  = Order.create!(annonce: annonce, amount: annonce.price, state: 'pending', user: annonce.user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
                     name: annonce.titre_annonce,
                     images: [annonce.photo],
                     amount: annonce.price_cents,
                     currency: 'eur',
                     quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to annonce_path(annonce)
  end
end
