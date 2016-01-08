module TicTacToe
  describe Board do
    let(:board_1)       { Board.new(grid: 'grid') }
    let(:board_2)       { Board.new(grid: grid) }
    let(:default_board) { Board.new }
    let(:grid)          { [['', 'O', ''], ['', '', 'X'], ['', '', 'X']] }

    context '#initialize' do
      it 'initializes the board with a grid' do
        expect { board_1 }.not_to raise_error
      end

      it 'default grid has 3 arrays' do
        expect(default_board.grid.length).to eq 3
      end

      it 'has 3 elements in each sub array' do
        default_board.grid.each do |row|
          expect(row.length).to eq 3
        end
      end
    end

    context '#grid' do
      it 'outputs the grid' do
        expect(board_1.grid).to eq 'grid'
      end
    end

    context '#coords_cell' do
      it 'returns the coords of the cell' do
        expect(board_2.coords_cell(1,0)).to eq 'O'
      end
    end

    context '#set_cell' do
      it 'only accepts X or O' do
        expect{ board_2.set_cell(0,0,'jelly') }.to raise_error 'Please use X or O'
      end
      it 'places the new cell value' do
        board_2.set_cell(0,0,'X')
        expect(board_2.coords_cell(0,0)).to eq 'X'
      end
    end

    context "#game_over" do
      it "returns winner if someone won" do
        allow(default_board).to receive(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "returns draw if true" do
        allow(default_board).to receive(:winner?) { false }
        allow(default_board).to receive(:drawr?) { true }
        expect(default_board.game_over).to eq :draw
      end

      it "returns false game is in progress" do
        allow(default_board).to receive(:winner?) { false }
        allow(default_board).to receive(:draw?) { false }
        expect(default_board.game_over).to be_false
      end
    end
  end
end
