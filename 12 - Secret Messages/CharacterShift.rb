# module used for shifting characters by a given value
# it also handles overflow so that sift_character_by "Z", 1 results in "A"
module CharacterShift

  # Cipher and output alphabet just ranging from A to Z
  FIRST_CHARACTER_ORD = "A".ord
  LAST_CHARACTER_ORD = "Z".ord
  ALPHABET_SIZE = LAST_CHARACTER_ORD - FIRST_CHARACTER_ORD + 1

  private
  # simple helper method for classes dealing with shifting characters
  def shift_character_by(char, index)
    new_ord = (char.ord + index)
    if new_ord > LAST_CHARACTER_ORD
      new_ord -= ALPHABET_SIZE
    elsif new_ord < FIRST_CHARACTER_ORD
      new_ord += ALPHABET_SIZE
    end
    new_ord.chr
  end
end

