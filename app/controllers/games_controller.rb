class GamesController < ApplicationController
  def resume
    if game = Game.last
      redirect_to game
    else
      redirect_to new_game_path
    end
  end
  
  def new
    @game = Game.new
    last = Game.most_recent
    @players = last ? last.player_names : []
  end
  
  def create
    @game = Game.new params[:game]
    @game.players.reject! {|p| p.name.blank?}
    if @game.save
      redirect_to @game
    else
      render :action => :new
    end
  end
  
  def show
    @game = Game.find params[:id]
  end
end
