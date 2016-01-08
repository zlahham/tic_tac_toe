module TicTacToe
  describe Board do
    subject     { Board.new(grid: 'grid') }
    let(:board) { Board.new }

    context '#initialize' do
      it 'initializes the board with a grid' do
        expect { subject }.not_to raise_error
      end

      it 'default grid has 3 arrays' do
        expect(board.grid.length).to eq 3
      end

      it 'has 3 elements in each sub array' do
        board.grid.each do |row|
          expect(row.length).to eq 3
        end
      end
    end

    context '#grid' do
      it 'outputs the grid' do
        expect(subject.grid).to eq 'grid'
      end
    end
  end
end
