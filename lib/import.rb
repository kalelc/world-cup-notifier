require 'json'
require 'time'
require_relative 'database'

class Import
  def initialize
    file = File.read('data/world-cup.json')
    @json = JSON.parse(file)
    @database = Database.new
  end

  def teams
    @json['teams'].each do |team|
      @database.db.execute("insert into teams values(
        #{team['id']},
        '#{team['name']}',
        '#{team['flag']}',
        '#{team['emojiString']}'
        )"
      )
    end
  end

  #row = @database.db.execute("select * from teams where id in(#{match['home_team']}, #{match['away_team']})")

  def matches
    @json['groups'].each do |groups|
      groups.last['matches'].each do |match|
      @database.db.execute("insert or ignore into matches(group_name, home_team, away_team, date_match) values(
        '#{groups.first}',
        '#{match['home_team']}',
        '#{match['away_team']}',
        #{Time.parse(match['date']).utc.to_i}
        )")
      end
    end
  end
end
