class NotificationsController < ApplicationController

	before_action :authenticate_user!

	def index
		@notifications = Notification.where(recipient: current_user).unread
		authorize @notifications

	end

	def mark_as_seen
		@notifications = Notification.where(recipient: current_user).unread
		@notifications.update_all(read_at: Time.zone.now)
		authorize @notifications

		render json: { success: true }
	end

end
