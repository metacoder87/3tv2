            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv2


    require_relative 'board'
    require_relative 'human_player'

class Game

# The Game class will be the main class that houses the instances of Board and 
# HumanPlayer required for gameplay. It will be responsible for passing data 
# between the board and players. It will also serve to contain the main game loop.
# Be sure to require your board.rb and human_player.rb files into game.rb.

# Game#initialize(player_1_mark, player_2_mark)

# An instance of Game should have instance variables for player one, player two, 
# and the board. Design the #initialize method to accept the mark values to be 
# used for the players.
# You should also initialize an instance variable to contain the current player. 
# By default, player one should begin as the current player.

# Game#initialize (refactor)

# Refactor this method to also accept a number for the board size as the first argument.
# An instance of Game will now need to track an array of many players instead of 
# just two. Make this an instance variable. Allow your #initialize to accept any 
# number of mark values. The number of marks passed to #initialize will decide how 
# many players are in the game.

    def initialize(n, *marks)
        @players = []
        @marks = marks.each do |mark| 
            @players << HumanPlayer.new(mark)
        end
        @current_player = @players[0]
        @current_mark = @marks[0]
        @board = Board.new(n)
    end

# Game#switch_turn

# This method should set the current player to the other player. Calling this 
# method repeatedly should switch the current player back and forth between the 
# two players.

# Game#switch_turn (refactor)

# For our switching logic, we'll use a "Round Robin" strategy. This means that 
# players continually take turns in the same order. For example, if we had players 
# A, B, and C, then the turns would be ABCABCABC... until the game is over.

# For simplicity, we'll always designate whoever is at the front of the array as 
# the current player. Consider using Array#rotate! to accomplish this.

    def switch_turn
        @current_mark = @marks.rotate!.first
        @current_player = @players.rotate!.first
    end

# Game#play

# This method will contain the main game loop. Here is some psuedocode for the loop:
# while there exists empty positions on the board
#     print the board
#     get a position from the current player
#     place their mark at that position of the board
#     check if that user has won
#     if they win, print out a 'victory' message saying who won 
#     and return to end the game
#     otherwise they did not win, so switch turns
#     if we finish the while loop without returning, that means there are no more 
#     empty positions on the board and noone has won, so print a 'draw' message
#     Test your game in pry. Play a few games by creating an instance of Game and 
#     invoking #play on it. After a game is over, be sure to create a new instance 
#     of Game to play again, this is the only way to get a fresh board. Some 
#     scenarios to test are: player one winning, player two winning, and a draw.
# If any errors are raised during gameplay, your game loop and #play method will 
# end immediately, so you'll have to start a new game and retry!

    def play
        while @board.empty_positions?
            @board.print
            $pot = @current_player.get_position
            @board.place_mark($pot, @current_mark)

            if @board.win?(@current_mark)
                @board.print
                return "Victory for #{@current_mark}"
            else switch_turn
            end
        end
            @board.print
        return "Draw Game, no winner."
    end

end
            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv2