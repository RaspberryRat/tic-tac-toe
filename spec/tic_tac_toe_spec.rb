require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:@game_board, instance_double(Board))
  end

  describe '#game_over' do
    context 'player 1 is the winner' do
      it 'puts winning statement' do
        expect(winning_game.new_game).to receive(:new_game)
        winning_game.new_game
      end
    end
  end
end
