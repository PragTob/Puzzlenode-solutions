require_relative 'CharacterShift'

# used to decrypt single words using the Caesar chiffre
# a dictionary is used to check the results vor validity
class Caesar
extend CharacterShift

  # Given a single word try to decrypt it with the help of a given dictionary
  def self.decrypt(word, dictionary_name)
    dictionary = read_dictionary dictionary_name

    # perform all 26 possible rotations to each character of the cipher word
    (0..25).each do |index|
      deciphered_word = word.chars.inject("") { |word, char| word << shift_character_by(char, index) }

      # is our deciphered word included in the given dictionary?
      # the possibillity of multiple matching key words is ignored here,
      # since it doesn't arise in the code and the support cluttered my code
      # so I decided to remove it
      if dictionary.include? deciphered_word
        return deciphered_word
      end
    end
  end

  private

  # read in the dictionary thereby modifying it for our purpose (all uppercase)
  def self.read_dictionary(filename)
    File.foreach(filename).inject([]) {|dict, line| dict << line.chomp.upcase }
  end

end

