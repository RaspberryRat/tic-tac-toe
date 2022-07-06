require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
  subject(:game) { described_class.new }

  describe '#tie_game?' do
    context 'when game turn is more than 9, no moves left' do
      before do
       game.instance_variable_set(:@game_turn, 9)
      end
      it 'returns true' do
        expect(game.tie_game?).to be true
      end
    end
    context 'when a game turn is less than 9, not a tie game ' do
      before do
        game.instance_variable_set(:@game_turn, 8)
      end
      it 'returns false for turn 8' do
        expect(game.tie_game?).to be false
      end
      it 'returns false for turn 1' do
        game.instance_variable_set(:@game_turn, 8)
        expect(game.tie_game?).to be false
      end
    end
  end
  describe '#create_players' do
    context 'when no players, create @player1 and @player2 instance variable' do
      before do
       game.instance_variable_set(:@player1, nil)
       game.instance_variable_set(:@player2, nil)
      end
      it '@player1 will not be nil' do
        game.create_players
        expect(game.player1).to_not be_nil
      end
      it '@player2 will not be nil' do
        game.create_players
        expect(game.player2).to_not be_nil
      end
    end
  end
  describe '#turn' do
    context 'when turn is called expect @game_turn to advance' do
      before do
        game.instance_variable_set(:@game_turn, 1)
        game.instance_variable_set(:@player_turn, 0)
      end
      it '@game_turn should advance to 2' do
        expect { game.turn }.to change {game.game_turn }.to(2)
        game.turn
      end
    end
  end

        
end
