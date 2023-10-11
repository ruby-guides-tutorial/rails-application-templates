## Notifications

**关注**

```ruby
Notification.create(
  notify_type: 'follow',  # 类型
  actor: current_account, # actor_id
  user: Account.find(2)   # 通知对象
)
```

**点赞和收藏**

```ruby
Notification.create(
  notify_type: 'star',  # 类型
  actor: Account.find(1), # actor_id
  user: Account.find(2),   # 通知对象
  target: Event.find(1)
)
```



**读取**

```ruby
 Notification.read!(current_user, params[:ids])
 ```

## Ref

* <https://github.com/rails-engine/notifications>