# notifications-rails

## Note : this is not a gem or a library, just copy each file to its corresponding folder and start using it ! For user.rb it's there just to show the has_many relationship between users and notifications

### USAGE :

```
(@forum_thread.users.uniq - [current_user]).each do |user|
    Notification.create(recipient: user, actor: current_user, action: 'posted', notifiable: @forum_post)
end
```
