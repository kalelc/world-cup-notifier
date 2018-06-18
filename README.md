# Russian World Cup Notifier

This is a simple project in Ruby to get notifications about matches played. The notifications are sent to slack creating a webhook.


## Create Webhook on Slack

Slack -> configure app -> custom integrations -> add configuration -> incoming webhook -> select channel -> add incoming web hook integration

## Install App

1. `bundle install`
2. `rake database:migrate`
3. `rake import:all`
4. Create crontab to call each hour:

`0 * * * * <patch bin ruby> <path app>notifier.rb` 

## Example

![alt text](https://raw.githubusercontent.com/kalelc/world-cup-notifier/master/img/example.png)
