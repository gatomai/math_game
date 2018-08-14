require './player.rb'
require './problems.rb'

class Game
  def initialize
    @player1 = Player.new('Ram')
    @player2 = Player.new('Albert')
    @problem1 = Problem.new
    @current_player = @player1
  end

  def players
    [@player1, @player2]
  end

  def get_target(current_player)
    if current_player == @player1
      @player2
    else
      @player1
    end
  end

  def summary
    summary = players.map(&:summary).join("\n")
    ''"
----- SUMMARY -----
#{summary}
-------------------
    "''
  end

  def game_over?
    players.any?(&:dead?)
  end

  def find_winner
    players.reject(&:dead?).first
  end

  def eval_answer(ans)
    if ans
      print "#{@current_player.name} : YES! You are correct"
    else
      print "#{@current_player.name} : Seriously? No!"
    end
  end

  def run
    until game_over?
      puts
      puts "#{@current_player.name}'s Turn!"
      puts

      puts @problem1.generate_problem
      print ">"
      ans = gets.chomp
      result = @problem1.check_answer?(ans)
      puts result

      eval_answer(result)

      @current_player.decrement_score unless result

      target = get_target(@current_player)

      puts summary
      @current_player = if @current_player == @player1
                          @player2
                        else
                          @player1
                        end

      sleep 0.5
    end

    winner = find_winner
    puts "#{winner.name} has HAS WON THE player FIGHT!!"
  end
end
