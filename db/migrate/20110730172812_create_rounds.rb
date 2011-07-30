class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.references :game
      t.references :leader
      t.integer :round_num
      t.integer :passes
      t.integer :failures

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
