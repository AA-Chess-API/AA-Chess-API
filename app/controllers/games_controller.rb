class GamesController < ApplicationController
  def index
    if params[:all] = "true"
      render json: Game.all
    else
      render json: Game.eligible_games
    end
  end

  def create
    game = Game.new(name: params[:game_name], initiator_id: params[:player_name])

    if game.save
      render json: ({ game_name: :game_name,
                   initiator_id: :player_name,
                            url: game_url(game, player: game.initiator_id) })
    else
      render text: 404
    end
  end

  def join
    game = Game.find_by_name(params[:game_name])

    if game && game.state == 'WAITING'
      game.state = "PLAYING"

      game.set_challenger(params[:player_name])
      render json: game_url(game, player: game.challenger_id)
    else
      render text: 404
    end
  end

  def show
    game = Game.find(params[:id])

    if game
      res = game.get_state_for(params[:player])
      render json: res
    else
      render text: 404
    end
  end

  def update
    game = Game.find(params[:id])

    if game
      res = game.confirm_move_of(params[:player], params[:move])
      render text: res
    else
      render text: 404
    end
  end

  def quit
    game = Game.find_by_name(params[:game_name])

    if game && game.end_game!(params[:player_name])
      render text: "Game Over!"
    else
      render text: 404
    end
  end
end
