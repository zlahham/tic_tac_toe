module TicTacToe
  describe Board do
    let(:default_board) { Board.new }
    let(:fake_board)    { Board.new(grid: 'grid') }
    let(:board_1)       { Board.new(grid: grid_1) }
    let(:board_2)       { Board.new(grid: grid_2) }
    let(:board_3)       { Board.new(grid: grid_3) }
    let(:board_4)       { Board.new(grid: grid_4) }
    let(:board_5)       { Board.new(grid: grid_5) }
    let(:board_6)       { Board.new(grid: grid_6) }
    let(:grid_1)        { [[empty, o_cell, empty], [empty, empty, x_cell], [empty, empty, x_cell]] }
    let(:grid_2)        { [[x_cell, x_cell, x_cell], [o_cell, x_cell, o_cell], [o_cell, o_cell, empty]] }
    let(:grid_3)        { [[x_cell, x_cell, empty], [o_cell, x_cell, o_cell], [o_cell, x_cell, empty]] }
    let(:grid_4)        { [[x_cell, empty, empty], [o_cell, x_cell, o_cell], [o_cell, x_cell, x_cell]] }
    let(:grid_5)        { [[x_cell, o_cell, x_cell], [o_cell, x_cell, o_cell], [o_cell, x_cell, o_cell]] }
    let(:grid_6)        { [[x_cell, empty, empty], [o_cell, empty, empty], [o_cell, empty, empty]] }
    let(:x_cell)        { 'X' }
    let(:o_cell)        { 'O' }
    let(:empty)         { '' }

    context '#initialize' do
      it 'initializes the board with a grid' do
        expect { fake_board }.not_to raise_error
      end

      it 'default grid has 3 arrays' do
        expect(default_board.grid.length).to eq 3
      end

      it 'has 3 elements in each sub array' do
        default_board.grid.each { |row| expect(row.length).to eq 3 }
      end
    end

    context '#grid' do
      it 'outputs the grid' do
        expect(fake_board.grid).to eq 'grid'
      end
    end

    context '#find_cell' do
      it 'returns the coords of the cell' do
        expect(board_1.find_cell(1, 0)).to eq 'O'
      end
    end

    context '#set_cell' do
      it 'places the new cell value' do
        default_board.set_cell(0, 0, 'X')
        expect(default_board.find_cell(0, 0)).to eq 'X'
      end
    end

    context '#game_over' do
      it 'returns :winner if winner? is true' do
        allow(default_board).to receive(:winner?) { true }
        expect(default_board.game_over).to eq :winner
      end

      it 'returns :draw if winner? is false and draw? is true' do
        allow(default_board).to receive(:winner?) { false }
        allow(default_board).to receive(:draw?) { true }
        expect(default_board.game_over).to eq :draw
      end

      it 'returns false if winner? is false and draw? is false' do
        allow(default_board).to receive(:winner?) { false }
        allow(default_board).to receive(:draw?) { false }
        expect(default_board.game_over).to be false
      end

      it 'returns :winner when row has objects with values that are all the same' do
        expect(board_2.game_over).to eq :winner
      end

      it 'returns :winner when colum has objects with values that are all the same' do
        expect(board_3.game_over).to eq :winner
      end

      it 'returns :winner when diagonal has objects with values that are all the same' do
        expect(board_4.game_over).to eq :winner
      end

      it 'returns :draw when all spaces on the default_board are taken' do
        expect(board_5.game_over).to eq :draw
      end

      it 'returns false when there is no winner or draw' do
        expect(board_6.game_over).to be false
      end
    end
  end
end
