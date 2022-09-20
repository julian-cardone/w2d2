class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
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




end
