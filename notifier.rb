require 'time'
require 'slack-notifier'
require_relative 'lib/database'

#TODO Harcode value defined in Chile's Hour
OFFSET = (60 * 60 * 4)
SLACK_HOOK = ''

@database = Database.new
matches = @database.db.execute("select m.date_match, t1.name, t1.emoji_flag, t2.name, t2.emoji_flag from matches m
                                join teams t1 on m.home_team = t1.id
                                join teams t2 on m.away_team = t2.id")

matches.each do |match|
  date_match = Time.at(match[0]).utc - OFFSET
  date_now = Time.now.utc - OFFSET

  if Date.today.to_s == date_match.strftime("%Y-%m-%d") && date_now < date_match
    value = "#{match[1]} #{match[2]}  VS #{match[3]} #{match[4]}   #{date_match.strftime("%Y-%m-%d %H:%M")}"
    notifier = Slack::Notifier.new(SLACK_HOOK)
    notifier.ping(value)
  end
end
