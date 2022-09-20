class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length){"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
      false
  end

def get_matching_indices(char)
  new_arr = []
  @secret_word.each_char.with_index do |ele, i|
    new_arr << i if ele == char
  end
  new_arr
end

def fill_indices(char, arr)
  @guess_word.map!.with_index do |ele, i|
    ele = char if arr.include?(i)
    ele
  end
end

def try_guess(char)
  if !already_attempted?(char)
    @attempted_chars << char 
    if !get_matching_indices(char).empty?
      fill_indices(char, get_matching_indices(char))
    end
    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    end
    return true
  end
  if already_attempted?(char)
    print "that has already been attempted" 
    return false
  end
end

def ask_user_for_guess
  print "Enter a char"
  char = gets.chomp
  return try_guess(char)
end

def win?
  if @guess_word.join('') == @secret_word
    print 'WIN'
    return true
  else
    return false
  end
end

  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    else
      return false
    end
  end

def game_over?
  if win? || lose?
    print @secret_word
    return true
  else
    return false
  end
end

end
