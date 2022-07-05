require './lib/game'

describe Game do
  describe '#game_over' do
    subject(:winning_game) { described_class.new }

    context 'player 1 is the winner' do
      it 'puts winning statement' do
        expect(winning_game.new_game).to receive(:new_game)
        winning_game.new_game
      end
    end
  end
end
