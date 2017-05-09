require_relative 'player'
require_relative 'question'

class Game

  def self.run
    @game = true
    @turn = 0
    
    puts "Welcome to THE GAME"

    print "Player1 username: "
    @p1_name = gets.chomp
    print "Player2 username: "
    @p2_name = gets.chomp
 
    player1 = Player.new(@p1_name)
    player2 = Player.new(@p2_name)
    
    puts "Let's Begin!!!"

    while @game
      question = Question.new

      case @turn
      when 0
        puts "#{player1.name}'s turn: "
      else 
        puts "#{player2.name}'s turn: "
      end
    
      puts question.print_question

      @user_answer = gets.chomp.to_i
      if @turn == 0 && question.correct?(@user_answer)
        puts "Correct answer!!"
        player1.score_remain
        @turn += 1
      elsif @turn == 0 && !question.correct?(@user_answer)
        puts "Come on man! This answer is wrong!"
        player1.lose_life
        @turn += 1
      elsif @turn == 1 && question.correct?(@user_answer)
        puts "Correct answer!!"
        player2.score_remain
        @turn -= 1
      elsif @turn == 1 && !question.correct?(@user_answer)
        puts "Come on man! This answer is wrong!"
        player2.lose_life
        @turn -= 1
      end
      
      puts "#{player1.name}: #{player1.lives} vs #{player2.name}: #{player2.lives}"

      puts "<---------- Next Round ---------->"

      if player1.lives < 1 || player2.lives < 1
        puts "Game Over"
        if player1.lives > player2.lives
          puts "The winner is #{player1.name}, with #{player1.lives} lives remaining"
        elsif player1.lives < player2.lives
          puts "The winner is #{player2.name}, with #{player2.lives} lives remaining"
        end

      @game = false
      end
    end
  end
end

Game.run
