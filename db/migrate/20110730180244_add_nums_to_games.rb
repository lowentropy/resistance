class AddNumsToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :num_spies, :integer
    add_column :games, :num_agents, :integer
  end

  def self.down
    remove_column :games, :num_agents
    remove_column :games, :num_spies
  end
end
