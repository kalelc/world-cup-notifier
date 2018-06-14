require 'sqlite3'

class Database

  attr_reader :db

  def initialize
    @db = SQLite3::Database.new "data/world-cup.db"
  end

  def migrate
    team
    match
  end

  def team
    @db.execute <<-SQL
      create table teams (
        id integer primary key,
        name varchar,
        flag text,
        emoji_flag varchar
      );
    SQL
  end

  def match
    @db.execute <<-SQL
      create table matches (
        id integer primary key autoincrement,
        group_name varchar,
        home_team int,
        away_team int,
        date_match int
      );
    SQL
  end

  def indexes
    @db.execute <<-SQL
      CREATE UNIQUE INDEX IF NOT EXISTS unique_date_match ON matches(date_match)
    SQL
  end
end
