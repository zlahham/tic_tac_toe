module TicTacToe
  describe Game do

    let (:player_1) { Player.new({name: "Zaid", weapon: "X"}) }
    let (:player_2) { Player.new({name: "Lahham", weapon: "O"}) }
    let (:arr)      { Array.any_instance }
    let (:game)     { Game.new([player_1, player_2]) }

    context "#initialize" do
      it "randomly selects a current_player" do
        allow_any_instance_of(Array).to receive(:shuffle).and_return( [player_1, player_2] )

        expect(game.current_player).to eq player_1
      end

      it "randomly selects an other player" do
        allow_any_instance_of(Array).to receive(:shuffle).and_return( [player_1, player_2] )
        expect(game.other_player).to eq player_2
      end
    end

    context "#change_players" do
      it "will set alternate them" do
        other_player = game.other_player
        game.change_players
        expect(game.current_player).to eq other_player
      end

      it "will set @other_player to @current_player" do
        current_player = game.current_player
        game.change_players
        expect(game.other_player).to eq current_player
      end
    end
  end
end
