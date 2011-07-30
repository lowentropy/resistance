class AddWinsToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :spy_wins, :integer
    add_column :games, :agent_wins, :integer
    add_column :games, :team_foils, :integer
  end

  def self.down
    remove_column :games, :team_foils
    remove_column :games, :agent_wins
    remove_column :games, :spy_wins
  end
end
