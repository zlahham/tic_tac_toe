describe TicTacToe::Game do
  describe '#play' do
    it 'ends if the game is over' do
      player_1 = double('player')
      player_2 = double('player')
      board    = double('board', game_over: :draw)
      game = TicTacToe::Game.new(player_2, player_2, board)
      expect(player_1).not_to receive(:next_move?)
      game.play
    end
  end

  describe '#play_round' do
    it 'swaps the players and marks the board if valid move' do
      player_1 = double('player 1', weapon: 'X', next_move?: [0, 0])
      player_2 = double('player 2')
      game = TicTacToe::Game.new(player_1, player_2)
      game.play_round
      expect(game.board.find_cell(0, 0)).to eq 'X'
      expect(game.current_player).to eq player_2
    end
  end
end
