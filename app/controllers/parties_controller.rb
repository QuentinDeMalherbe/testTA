class PartiesController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    @party = Party.new;
  end

  def create
    @game = Game.find(params[:game_id])
    @parti = Party.new();
    if @parti.save!
      # faire le compte des 5 fois !! ( gerer ces 5 fois )
    else
      render new
    end
  end
end
