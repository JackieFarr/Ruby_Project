require_relative("../models/player.rb")
require_relative("../models/team.rb")
require("pry-byebug")

Player.delete_all
Team.delete_all

team1 = Team.new({
  "name" => "Manchester City"
  })

team2 = Team.new({
  "name" => "Tottenham Hotspur"
  })

team3 = Team.new({
  "name" => "Chelsea"
  })

team4 = Team.new({
  "name" => "Watford"
  })

team1.save
team2.save
team3.save
team4.save

player1 = Player.new({
  "first_name" => "Vincent",
  "last_name" => "Kompany",
  "team_id" => team1.id,
  "position" => "Defender",
  "salary" => 1000000,
  "injury" => "No",
  "goals" => 15
  })

player2 = Player.new({
  "first_name" => "David",
  "last_name" => "Silva",
  "team_id" => team1.id,
  "position" => "Midfielder",
  "salary" => 2000000,
  "injury" => "No",
  "goals" => 25
  })

player3 = Player.new({
  "first_name" => "Kevin",
  "last_name" => "Du Bruyne",
  "team_id" => team1.id,
  "position" => "Midfielder",
  "salary" => 3000000,
  "injury" => "No",
  "goals" => 8
  })

player4 = Player.new({
  "first_name" => "Ederson",
  "last_name" => "Moraes",
  "team_id" => team1.id,
  "position" => "Goalkeeper",
  "salary" => 600000,
  "injury" => "No",
  "goals" => 0
  })

player5 = Player.new({
  "first_name" => "Leroy",
  "last_name" => "Sane",
  "team_id" => team1.id,
  "position" => "Forward",
  "salary" => 600000,
  "injury" => "No",
  "goals" => 0
  })

player6 = Player.new({
  "first_name" => "Harry",
  "last_name" => "Kane",
  "team_id" => team2.id,
  "position" => "Forward",
  "salary" => 700000,
  "injury" => "No",
  "goals" => 11
  })

player7 = Player.new({
  "first_name" => "Hugo",
  "last_name" => "Lloris",
  "team_id" => team2.id,
  "position" => "Goalkeeper",
  "salary" => 500000,
  "injury" => "No",
  "goals" => 0
  })

player8 = Player.new({
  "first_name" => "Dele",
  "last_name" => "Alli",
  "team_id" => team2.id,
  "position" => "Midfielder",
  "salary" => 500000,
  "injury" => "No",
  "goals" => 7
  })

player9 = Player.new({
  "first_name" => "Kieran",
  "last_name" => "Trippier",
  "team_id" => team2.id,
  "position" => "Defender",
  "salary" => 500000,
  "injury" => "No",
  "goals" => 7
  })

player10 = Player.new({
  "first_name" => "Mousa",
  "last_name" => "Dembele",
  "team_id" => team2.id,
  "position" => "Midfielder",
  "salary" => 900000,
  "injury" => "No",
  "goals" => 4
  })


player1.save
player2.save
player3.save
player4.save
player5.save
player6.save
player7.save
player8.save
player9.save
player10.save


# binding.pry
# nil
