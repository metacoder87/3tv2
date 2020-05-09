            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv2


require 'game'
require 'board'

describe "Game" do
  let(:game) { Game.new(3) }

    describe "#initialize" do
      it "should accept a number, n, as an arg" do
        game
      end

      it "should set @board to an instance of Board::new" do
        board = game.instance_variable_get(:@board)
        expect(board).to be_instance_of(Board)
      end

      it "should set @current_player to the first player" do
        player = game.instance_variable_get(:@current_player)
        expect(player).to be($player_1)
      end

    end

end
            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv2