require_relative("../models/player.rb")
require_relative("../models/team.rb")
require("pry-byebug")

Player.delete_all
Team.delete_all

team1 = Team.new({
  "name" => "Man City"
  })

team1.save

player1 = Player.new({
  "first_name" => "Vincent",
  "last_name" => "Kompany",
  "team_id" => team1.id,
  "position" => "Defender",
  "salary" => 1000000,
  "injury" => "No",
  "goals" => 15
  })

player1.save
