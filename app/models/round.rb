class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :leader
  has_one :team
  
  def passes?
    failures == 0
  end
  
  def fails?
    failures > 0
  end
  
  def winner
    fails? ? :spy : :agent
  end
end
