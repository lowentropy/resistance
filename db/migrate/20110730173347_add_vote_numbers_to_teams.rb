class AddVoteNumbersToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :votes_for, :integer
    add_column :teams, :votes_against, :integer
  end

  def self.down
    remove_column :teams, :votes_against
    remove_column :teams, :votes_for
  end
end
