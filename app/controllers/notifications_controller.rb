class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_notification, only: [:destroy]

  def index
    @notifications = policy_scope(Notification.where("recipient_id = ?", current_user.id)).unread
  end

  def all_notifications
    authorize @notifications = policy_scope(Notification.where("recipient_id = ?", current_user.id)).order(created_at: :desc)
    delete_non_notifiable
  end

  def destroy
    authorize @notification
    @notification.destroy
    @notification.save
    redirect_to all_notifications_path
  end

  def mark_as_read
    authorize @notifications = Notification.where("recipient_id = ?", current_user.id).unread
    # @notifications.update.all(read_at: Time.zone.now)
    @notifications.each do |notification|
      notification.read_at = Time.now
      notification.save
    end
    render json: {success: true}
    delete_non_notifiable
  end

  # check all notification and delete all where notification.notifiable == nil
  def delete_non_notifiable
    @notifications = Notification.all
    # @notifications.each do |notif|
    #   if notif.notifiable == nil
    #     notif.destroy
    #   end
    # end
    @non_notifiable = @notifications.find_all { |i| i.notifiable == nil }
    @non_notifiable.each do |notif|
      notif.destroy
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

end
