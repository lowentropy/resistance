class MakeDefaultSpyOddsOneHalf < ActiveRecord::Migration
  def self.up
    change_column :players, :spy_odds, :float, :default => 0.5
  end

  def self.down
  end
end
