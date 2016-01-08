module TicTacToe
  describe Board do
    subject { Board.new(grid: 'grid') }

    context "#initialize" do
      it "initializes the board with a grid" do
        expect { subject }.not_to raise_error
      end

      it 'default grid has 3 arrays' do
        board = Board.new
        expect(board.grid.length).to eq 3
      end
    end
  end
end
