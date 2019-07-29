class @Notifications

	constructor: ->

		@notifications = $('[data-behavior=notifications]')
		@setupNotifications() if @notifications.length > 0

		@setEvents()


	setEvents: ->

		#

	setupNotifications: ->

		$.ajax({

			url: '/notifications.json',
			dataType: 'JSON',
			method: 'GET',
			success: (data) =>

				items = $.map data, (notification) ->

					"""
						<a class="navbar-item" href="#{notification.url}">
							#{notification.actor} #{notification.action} #{notification.notifiable.type}
						</a>
					"""

				if items.length > 0

					$('[data-behavior=unread-notifications-size]').show().text(items.length)

					$('[data-behavior=notification-items]').html(items)

				else

					$('[data-behavior=notification-items]').html("<div class='navbar-item has-text-grey'>You have no notification !</div>")

		})


		$('[data-behavior=notifications]').on 'click', ->

			$.ajax({
				url: '/notifications/mark_as_seen',
				method: 'POST',
				dataType: 'JSON',
				success: (data) ->

					$('[data-behavior=unread-notifications-size]').text('').hide()

				error: ->
					console.log 'error making notifications as read' if console

			})
