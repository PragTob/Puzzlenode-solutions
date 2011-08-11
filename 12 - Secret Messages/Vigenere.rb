require_relative 'CharacterShift'
require_relative 'RepeatingKey'

# class for decrypting Vigenere with a given key word
class Vigenere
  extend CharacterShift

  def self.decrypt(cipher, key)
    @key = RepeatingKey.new key
    result = cipher.chars.inject("") do
      | result, char |
      # our message consists just of characters from A to Z
      if char.match /[A-Z]/
        result << decipher_char(char)
      # all other characters aren't encrypted, hence just appended
      else
        result << char
      end
    end
    result
  end

  private
  # decipher a single character
  def self.decipher_char(char)
    # we have to shift back by the difference
    shift_value = - (@key.next.ord - CharacterShift::FIRST_CHARACTER_ORD)
    shift_character_by char, shift_value
  end

end

