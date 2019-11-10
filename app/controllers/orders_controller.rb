class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]

  def create
    authorize annonce = Annonce.find(params[:annonce_id])
    authorize order  = Order.create(annonce: annonce, amount: annonce.price, state: 'pending', user: current_user)
    # paiement Stripe
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
    # Changer le statut de checkout proprio sur "check"
    annonce.checkout_proprio = "check"
    annonce.save
    # Create a notification
    @admin = User.where("email = ?", "contact@realbeez.com")[0]
    @recipient = User.find(annonce.agent_user_id)
    Notification.create(recipient: @admin, actor: current_user, action: "checkout_proprio_notify_admin", notifiable: order)
    Notification.create(recipient: @recipient, actor: current_user, action: "checkout_proprio_notify_agent", notifiable: order)
    # Send email to Admin
    mail_admin = OrderMailer.with(order: order).checkout_proprio_notify_admin
    mail_admin.deliver_now
    # Send email to Agent
    mail_agent = OrderMailer.with(order: order).checkout_proprio_notify_agent
    mail_agent.deliver_now
    if annonce.checkout_agent == "check" && annonce.checkout_proprio == "check"
      annonce.statut = "Loué"
      annonce.save
    end
    redirect_to orders_path
  end

  def show
    authorize @order
  end

  def index
    @orders = policy_scope(Order).order(created_at: :asc)
    @orders_en_attente = policy_scope(Order.where("state = ?", "pending")).order(created_at: :asc)
    @orders_payés = policy_scope(Order.where("state = ?", "paid")).order(created_at: :asc)
  end

  def destroy
    authorize @order
    @order.annonce.statut = 'active'
    @order.annonce.checkout_proprio = nil
    @order.annonce.save
    @order.destroy
    @notifications = Notification.where("notifiable_id = ?", @order)
    @notifications.each do |notification|
      notification.destroy
      notification.save
    end
    redirect_to mes_annonces_path
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

end
