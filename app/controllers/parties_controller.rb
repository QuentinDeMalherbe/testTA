class PartiesController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    @party = Party.new;
    @party.ten_letters_list = @party.random_array.join;
  end

  def create
    @game = Game.find(params[:game_id]);
    @party = Party.new(party_params);
    @party.game = @game
    @party.available = @party.avalaible?;
    @party.score = @party.word.length;
    if @party.available  && @party.save!
      redirect_to game_path(@game)
    else
      render 'parties/new'
    end
  end

  private

  def party_params
    params.require(:party).permit(:word, :ten_letters_list);
  end
end
