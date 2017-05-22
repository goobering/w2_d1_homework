class Team

# attr_reader :name, :players
# attr_accessor :players

def initialize(name, players, coach)
  @name = name
  @players = players
  @coach = coach
  @points = 0
end

def get_name()
  return @name
end

def get_players()
  return @players
end

def get_coach()
  return @coach
end

def set_coach(coach)
  @coach = coach
end

def get_points()
  return @points
end 

def add_player_to_team(player)
  @players.push(player)
end

def is_in_team(player_name)
  if @players.include?(player_name)
    return true
  else
    return false
  end
end

def update_points(win_lose)
  if win_lose == "win"
    @points += 1
  elsif win_lose == "lose"
    @points -= 1
  end
end

end