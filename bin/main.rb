#!/usr/bin/env ruby
require_relative '../lib/gameboard'
require_relative '../lib/player'

class StartGame
  def initialize
    puts 'Welcome to our tic-tac-toe game'

    puts 'Enter your name: '
    first_player_name = gets.chomp
    first_player_sym = 'X'

    player1 = Player.new(first_player_name, first_player_sym)

    puts 'Enter your name: '
    second_player_name = gets.chomp
    second_player_sym = 'O'

    player2 = Player.new(second_player_name, second_player_sym)

    game_board = GameBoard.new(player1, player2)

    game_board.display_board
    pos = 0
    count_times = 9
    count_times.times do |i|
      if (i % 2).zero?
        puts "#{player1.player_name}, pick your position (1-9): "
        pos = gets.chomp.to_i
        count_times += 1 if pos.zero?
        while game_board.check_pos?(pos)
          puts "#{player1.player_name}, pick another number: "
          pos = gets.chomp.to_i
        end
        game_board.update_board(pos, player1)
        game_board.display_board
        if game_board.check_winner?(player1)
          puts "#{player1.player_name}, Congratulations! You won!"
          break
        end
      else
        puts "#{player2.player_name}, pick your position (1-9): "
        pos = gets.chomp.to_i
        count_times += 1 if pos.zero?
        while game_board.check_pos?(pos)
          puts "#{player2.player_name}, pick another number: "
          pos = gets.chomp.to_i
        end
        game_board.update_board(pos, player2)
        game_board.display_board
        if game_board.check_winner?(player2)
          puts "#{player2.player_name}, Congratulations! You won!"
          break
        end
      end
      puts 'Oops, nobody won!' if i >= 8 && !game_board.check_winner?(player1) && !game_board.check_winner?(player2)
    end
  end
end

StartGame.new
