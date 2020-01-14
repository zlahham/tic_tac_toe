# typed: false
# frozen_string_literal: true

module TicTacToe
  describe Game do
    let(:player_1) { Player.new(name: 'Zaid', weapon: 'X') }
    let(:player_2) { Player.new(name: 'Lahham', weapon: 'O') }
    let(:board)    { Board.new }
    let(:player_1) { double('player 1', weapon: 'X', next_move?: [0, 0]) }
    let(:player_2) { double('player 2') }
    let(:game)     { Game.new(player_1, player_2) }

    context '#play' do
      context 'when over' do
        it 'ends if there is a draw' do
          game = TicTacToe::Game.new(player_2, player_1)
          allow(game).to receive(:play).and_return(:draw)
          expect(game.play).to eq(:draw)
        end

        it 'ends if there is a winner' do
          game = TicTacToe::Game.new(player_2, player_1)
          allow(game).to receive(:play).and_return(:winner)
          expect(game.play).to eq(:winner)
        end
      end
    end

    context '#play_round' do
      it 'swaps the players and marks the board if valid move' do
        game.play_round
        expect(game.board.find_cell(0, 0)).to eq 'X'
        expect(game.current_player).to eq player_2
      end
    end

    context '#current_player' do
      it 'returns the current_player' do
        expect(game.current_player).to eq player_1
      end
    end
    context '#other_player' do
      it 'returns the other_player' do
        expect(game.other_player).to eq player_2
      end
    end
  end
end
