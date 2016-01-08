module TicTacToe
  describe Cell do
    context '#initialize' do
      it 'is initialized as an empty string' do
        expect(subject.value).to eq ''
      end

      it 'can take a parameter of X' do
        cell = Cell.new('X')
        expect(cell.value).to eq 'X'
      end
      
      it 'can take a parameter of O' do
        cell = Cell.new('O')
        expect(cell.value).to eq 'O'
      end
    end
  end
end
