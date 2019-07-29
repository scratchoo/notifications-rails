# notifications-rails

## Add notification system to Rails app

### USAGE :

```
(@forum_thread.users.uniq - [current_user]).each do |user|
    Notification.create(recipient: user, actor: current_user, action: 'posted', notifiable: @forum_post)
end
```
