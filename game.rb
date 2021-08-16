require './question'
require './player'

class Game

  attr_accessor :game_over

  def initialize
    @game_over = false
    @players = []
    @players[0] = Player.new("Player 1")
    @players[1] = Player.new("Player 2")
    @turn = 0
  end

  def start
    while !game_over do 
      current_player = @players[@turn % 2]
      other_player = @players[(@turn + 1) % 2]
      question_answer = Question.get_question_answer
      question = question_answer[0]
      answer = question_answer[1][0] #Only [1] makes answer a one element array [17] instead of 17.
      puts "#{current_player.name}: #{question}"
      player_answer = $stdin.gets.chomp.to_i

      if player_answer == answer 
        puts "#{current_player.name}: YES! You are correct."
      else 
        current_player.lives -= 1
        puts "#{current_player.name}: No! Get some Math lessons!"

        if current_player.lives == 0
          puts "#{other_player.name} wins! Score: #{other_player.lives}/3"
          puts "----- GAME OVER -----"
          @game_over = true
          break
        end

      end

      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
      @turn += 1
      puts "----- NEW TURN -----"

    end
  end

end