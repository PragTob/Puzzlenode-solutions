# iterates over a key and starts at the beginning when the end is reached
# useful for encryptions where you need to reuse a key frequently (like Vigenere)
#
# implementation comment:
# it could have been done using an enumerator, however there is no "next?" method
# and I feel uncomfortable frequently catching the exception and calling rewind.
# However I haven't read "Exceptional Ruby" yet - so my view might change ;-)
class RepeatingKey

  def initialize (key)
    @key = key.split ""
    # start with -1 so the first value we get is 0
    @index = -1
  end

  # returns the next character of the key
  def next
    if @index == (@key.size - 1)
      @index = 0
    else
      @index += 1
    end
    @key[@index]
  end

end

