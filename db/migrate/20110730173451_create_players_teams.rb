class CreatePlayersTeams < ActiveRecord::Migration
  def self.up
    create_table :players_teams, :id => false do |t|
      t.references :player
      t.references :team

      t.timestamps
    end
  end

  def self.down
    drop_table :players_teams
  end
end
