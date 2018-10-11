require_relative("../db/sql_runner")

class Player

  attr_reader :id, :team_id
  attr_accessor :first_name, :last_name, :position, :salary, :injury, :goals

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @team_id = options["team_id"]
    @position = options["position"]
    @salary = options["salary"]
    @injury = options["injury"]
    @goals = options["goals"]
  end

  def position_order
    case @position
      when "Goalkeeper"
        return 1
      when "Defender"
        return 2
      when "Midfielder"
        return 3
      when "Forward"
        return 4
    end
  end

  def pretty_name
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO players
    (first_name,
    last_name,
    team_id,
    position,
    salary,
    injury,
    goals)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id"
    values =
    [@first_name,
      @last_name,
      @team_id,
      @position,
      @salary,
      @injury,
      @goals
      ]
    results = SqlRunner.run(sql, values)
    @id = results.first()["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM players"
    results = SqlRunner.run(sql)
    return results.map{|player| Player.new(player)}
  end

  def self.delete_all
    sql = "DELETE FROM players"
    SqlRunner.run(sql)
  end

  def team
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [@team_id]
    results = SqlRunner.run(sql, values)
    return Team.new(results.first)
  end

  def update()
    sql = "UPDATE players
    SET
    (first_name,
    last_name,
    team_id,
    position,
    salary,
    injury,
    goals)
    = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values =
      [
        @first_name,
        @last_name,
        @team_id,
        @position,
        @salary,
        @injury,
        @goals,
        @id
    ]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM players
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find(id)
    sql = "SELECT * FROM players
    WHERE id = $1"
    values = [id]
    player = SqlRunner.run(sql, values)
    result = Player.new(player.first)
    return result
  end

end
