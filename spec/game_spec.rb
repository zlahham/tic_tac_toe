module TicTacToe
  describe Game do

    let (:player_1) { Player.new({name: "Zaid", weapon: "X"}) }
    let (:player_2) { Player.new({name: "Lahham", weapon: "O"}) }
    let (:arr) { Array.any_instance }

    context "#initialize" do
      it "randomly selects a current_player" do
        allow_any_instance_of(Array).to receive(:shuffle).and_return( [player_1, player_2] )
        game = Game.new([player_1, player_2])
        expect(game.current_player).to eq player_1
      end

      it "randomly selects an other player" do
        allow_any_instance_of(Array).to receive(:shuffle).and_return( [player_1, player_2] )
        game = Game.new([player_1, player_2])
        expect(game.other_player).to eq player_2
      end
    end
  end
end
