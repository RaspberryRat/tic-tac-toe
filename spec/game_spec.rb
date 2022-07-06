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
end
