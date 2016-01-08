module TicTacToe
  describe Player do
    subject { Player.new(name: 'Zaid', weapon: 'X') }

    context '#initialize' do
      it 'raises an error when passed an empty Hash' do
        expect{ Player.new({}) }.to raise_error(KeyError)
      end

      it 'does not raise an error when passed the correct keys' do
        expect{ subject }.not_to raise_error
      end
    end

    context '#name' do
      it 'outputs the player name' do
        expect(subject.name).to eq 'Zaid'
      end
    end

    context '#weapon' do
      it 'outputs the player weapon' do
        expect(subject.weapon).to eq 'X'
      end
    end
  end
end
