require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
    
    
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if index < 0 || index > 8 || position_taken?(index)
      false
    else
      true
    end
  end
  
  def turn
    check = true
    while check == true
      puts "Gimme a position 1-9"
      input = gets.strip
      input = input_to_index(input)
      if valid_move?(input)
        move(input, current_player)
        display_board
        break
      end
    end
  end
  
  def turn_count
    count = 0
    i = 0
    while i < 9
      if position_taken?(i)
        count += 1
      end
      i+=1
    end
    count
  end
  
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  

  
  def full?
    if turn_count == 9
      true
    else
      false
    end
  end
  
  def won?
  
    WIN_COMBINATIONS.each {|combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && !(@board[combo[0]] == " ")
        return combo
      end
    }
    return false
  end
  
  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    combo = won?
    
    if combo == false
      return nil
    else
      return @board[combo[0]]
    end
  end
  
  def play
    while !(over?)
      turn
      if over?
        break
      end
    end
    if won?
      puts "Congrats to winner #{winner}"
    else
      puts "Cat's game!"
    end
  end
end