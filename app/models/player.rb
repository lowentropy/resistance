class Player < ActiveRecord::Base
  belongs_to :game
  has_and_belongs_to_many :teams
  
  def spy_strength
    [spy_odds * 2 - 1, 0].max
  end
  
  def agent_strength
    [spy_odds * 2 + 1, 0].max
  end
end
