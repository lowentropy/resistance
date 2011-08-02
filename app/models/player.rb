class Player < ActiveRecord::Base
  belongs_to :game
  has_and_belongs_to_many :teams
  
  acts_as_list :scope => :game
  
  def spy_strength
    [spy_odds * 2 - 1, 0].max
  end
  
  def agent_strength
    [1 - spy_odds * 2, 0].max
  end
  
  def strength
    spy? ? spy_strength : agent_strength
  end
  
  def spy?
    spy_odds > 0.5
  end
  
  def agent?
    spy_odds < 0.5
  end
  
  def neutral?
    spy_odds == 0.5
  end
  
  def side
    neutral? ? :neutral : (spy? ? :spy : :agent)
  end
  
end
