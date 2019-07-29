json.array! @notifications do |notification|
	json.id notification.id
	json.actor notification.actor.first_name
	json.notifiable do
		json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
	end
	json.url forum_thread_path(notification.notifiable.forum_thread, anchor: dom_id(notification.notifiable))
end
