class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new({user: current_user})
    if @game.save!
      redirect_to game_path(@game)
    else
      redirect_to root_path
    end
  end
end
