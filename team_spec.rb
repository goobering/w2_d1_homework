require 'Minitest/autorun'
require 'Minitest/rg'

require_relative 'team'

class TestTeam < MiniTest::Test

def setup()
  @players = ["Alice", "Bob", "Fred"]
  @team = Team.new("cohort2", @players, "Ally")
end

def test_get_team_name()
  assert_equal("cohort2", @team.get_name())
end

def test_get_team_players()
  assert_equal(@players, @team.get_players())
end

def test_get_team_coach()
  assert_equal("Ally", @team.get_coach())
end

def test_add_player_to_team()
  @team.add_player_to_team("George")
  assert_equal(4, @team.get_players().count())
end

def test_is_in_team()
  assert_equal(true, @team.is_in_team("Alice"))
end

def test_get_points()
  assert_equal(0, @team.get_points())
end

def test_team_win_game()
  @team.update_points("win")
  assert_equal(1, @team.get_points())
end

def test_team_lose_game()
  @team.update_points("win")
  @team.update_points("lose")

  assert_equal(0, @team.get_points())
end

end