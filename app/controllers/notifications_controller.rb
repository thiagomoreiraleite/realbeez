class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @notifications = policy_scope(Notification.where("recipient_id = ?", current_user.id)).unread
  end

  def mark_as_read
    authorize @notifications = Notification.where("recipient_id = ?", current_user.id).unread
    # @notifications.update.all(read_at: Time.zone.now)
    @notifications.each do |notification|
      notification.read_at = Time.now
      notification.save
    end
    render json: {success: true}
  end
end
