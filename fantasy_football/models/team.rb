require_relative("../db/sql_runner")

class Team

  attr_reader :id, :name

  def initialize (options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO teams (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM teams"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM teams"
    results = SqlRunner.run(sql)
    return results.map {|team| Team.new(team)}
  end

  def players
    sql = "SELECT players.* FROM players
    INNER JOIN teams
    ON players.team_id = teams.id
    WHERE players.team_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|player| Player.new(player)}
  end

  def sort_players
    players_array = players()
    sorted_players = players_array.sort() do |player_a, player_b|
      player_a.position_order() <=> player_b.position_order()
    end
    return sorted_players
  end

  def update
    sql = "UPDATE teams
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

## TEAMS WON'T BE DELETED ##
  # def delete()
  #   sql = "DELETE FROM teams
  #   WHERE id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql, values)
  # end

  def self.find(id)
    sql = "SELECT * FROM teams
    WHERE id = $1"
    values = [id]
    team = SqlRunner.run(sql, values)
    result = Team.new(team.first)
    return result
  end


end
