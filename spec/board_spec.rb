require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#winner?' do
    context 'when three X on top' do
      before do
        board.instance_variable_set(:@board, [['X', 'X', 'X'], ['_', '_', '_'], ['_', '_', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three X on in horizontal middle' do
      before do
        board.instance_variable_set(:@board, [['_', '_', '_'], ['X', 'X', 'X'], ['_', '_', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three X on bottom' do
      before do
        board.instance_variable_set(:@board, [['_', '_', '_'], ['_', '_', '_'], ['X', 'X', 'X']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three X on left' do
      before do
        board.instance_variable_set(:@board, [['X', '_', '_'], ['X', '_', '_'], ['X', '_', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three X vertical middle' do
      before do
        board.instance_variable_set(:@board, [['_', 'X', '_'], ['_', 'X', '_'], ['_', 'X', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three X right' do
      before do
        board.instance_variable_set(:@board, [['_', '_', 'X'], ['_', '_', 'X'], ['_', '_', 'X']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three X diagonal from top left' do
      before do
        board.instance_variable_set(:@board, [['X', '_', '_'], ['_', 'X', '_'], ['_', '_', 'X']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three X diagonal from top right' do
      before do
        board.instance_variable_set(:@board, [['_', '_', 'X'], ['_', 'X', '_'], ['X', '_', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three O on top' do
      before do
        board.instance_variable_set(:@board, [['O', 'O', 'O'], ['_', '_', '_'], ['_', '_', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three O on in horizontal middle' do
      before do
        board.instance_variable_set(:@board, [['_', '_', '_'], ['O', 'O', 'O'], ['_', '_', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three O on bottom' do
      before do
        board.instance_variable_set(:@board, [['_', '_', '_'], ['_', '_', '_'], ['O', 'O', 'O']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three O on left' do
      before do
        board.instance_variable_set(:@board, [['O', '_', '_'], ['O', '_', '_'], ['O', '_', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three O vertical middle' do
      before do
        board.instance_variable_set(:@board, [['_', 'O', '_'], ['_', 'O', '_'], ['_', 'O', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three O right' do
      before do
        board.instance_variable_set(:@board, [['_', '_', 'O'], ['_', '_', 'O'], ['_', '_', 'O']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three O diagonal from top left' do
      before do
        board.instance_variable_set(:@board, [['O', '_', '_'], ['_', 'O', '_'], ['_', '_', 'O']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when three O diagonal from top right' do
      before do
        board.instance_variable_set(:@board, [['_', '_', 'O'], ['_', 'O', '_'], ['O', '_', '_']])
      end
      it 'returns true' do
        expect(board.winner?).to be true
      end
    end
    context 'when there are three X at top and some Os on the board' do
      before do
        board.instance_variable_set(:@board, [['X', 'X', 'X'], ['O', '_', 'X'], ['_', 'O', 'O']])
      end
      it 'returns true' do 
        expect(board.winner?).to be true
      end
    end
    context 'when there are not three X or O in a row' do
      before do
        board.instance_variable_set(:@board, [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']])
      end
      it 'does not return true' do
        expect(board.winner?).to_not be true
      end
    end
    context 'when there are a lot of X and O but not three in a row' do
      before do
        board.instance_variable_set(:@board, [['X', 'O', 'O'], ['X', 'X', '_'], ['_', '_', '_']])
      end
      it 'does not return true' do
        expect(board.winner?).to_not be true
      end
    end
  end
  describe '#update_grid' do
    context 'when X is added to top left ' do
      before do
        board.instance_variable_set(:@board, [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']])
        board.instance_variable_set(:@game_turn, 1)
      end
      it 'updates board[0][0] to X' do
        expect { board.update_grid([0, 0, 'X']) }.to change { board.board[0][0] }.to('X')
      end
    end
    context 'when O is added to to middle ' do
      before do
        board.instance_variable_set(:@board, [['_', '_', '_'], ['_', '_', '_'], ['_', '_', '_']])
      end
      it 'updates board[0][0] to X' do
        expect { board.update_grid([1, 1, 'O']) }.to change { board.board[1][1] }.to('O')
      end
    end
  end



    

end