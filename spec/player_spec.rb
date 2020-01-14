# typed: false
# frozen_string_literal: true

module TicTacToe
  describe Player do
    subject { Player.new(name: 'Zaid', weapon: 'X') }
    let(:default_board) { Board.new }

    context '#initialize' do
      it 'raises an error when passed an empty Hash' do
        expect { Player.new({}) }.to raise_error(KeyError)
      end

      it 'does not raise an error when passed the correct keys' do
        expect { subject }.not_to raise_error
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

    context '#formatted_grid' do
      it 'shows the formatted grid' do
        expect(subject.formatted_grid(default_board).length).to eq 3
      end

      it 'shows the formatted grid as an array' do
        expect(subject.formatted_grid(default_board).is_a?(Array)).to eq true
      end
    end

    context '#color_x_o' do
      it 'colours X blue' do
        expect(subject.color_x_o('X')).to eq 'X'.blue
      end

      it 'colours O red' do
        expect(subject.color_x_o('O')).to eq 'O'.red
      end
    end
  end
end
