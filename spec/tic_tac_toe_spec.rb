require_relative '../lib/main'

describe Game do
end

describe Player do
end

describe Board do
  context 'when win_conditions are met'
  subject(:win_board) { described_class.new }
  describe '#winner?' do
    let(:win_combos) { double('win_combos')}
    it 'returns true if win_conditions are met' do
      expect(win_board.winner?).to be_true 
    end
  end
end
