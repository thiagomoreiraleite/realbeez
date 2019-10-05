class PaymentsController < ApplicationController
  def new
    authorize @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
