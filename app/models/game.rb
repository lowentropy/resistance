class Game < ActiveRecord::Base
  has_many :rounds
  has_many :players
  
  accepts_nested_attributes_for :players
  
  def self.most_recent
    order(:created_at.desc).first
  end
  
  def player_names
    players.map &:name
  end
  
  def over?
    spies_won? or agents_won? or teams_foiled?
  end
  
  def spies_won?
    spy_wins == 3
  end
  
  def agents_won?
    agent_wins == 3
  end
  
  def teams_foiled?
    team_foils == 5
  end
  
  def winner
    agents_won? ? :agent : :spy
  end
  
  def num_players
    num_spies + num_agents
  end
end
