class Team < ActiveRecord::Base
  belongs_to :round
  has_and_belongs_to_many :players
  
  def size
    players.count
  end
end
