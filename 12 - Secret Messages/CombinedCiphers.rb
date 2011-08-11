require_relative 'Caesar'
require_relative 'Vigenere'

# script for solving the Vigenere puzzle
# it parses the content and uses the decipher classes
# in order to decipher the text

# this dictionary is not my own work, it was installed
# on my Linux distribution (Linux Mint 10 - it's awesome!)
# it may be found in /usr/share/dict
# I use it just for convenience
DICTIONARY_NAME = 'american-english'
DEFAULT_CIPHER_FILE_NAME = 'complex_cipher.txt'

file_name = DEFAULT_CIPHER_FILE_NAME unless file_name = ARGV.first

file = File.open file_name
# the first line contains the keyword as a caesar cipher
caesar_key = file.readline.chomp

# just in case anything breaks on another system: the key is DANGEROUS
key = Caesar.decrypt(caesar_key, DICTIONARY_NAME)
puts "The key used for decryption is: " << key
# a new line seperates the key and the ciphertext, ignore it
file.readline

# decipher the text
cipher_text = file.each.inject("") { | cipher, line | cipher << line }
file.close

deciphered_text = Vigenere.decrypt cipher_text, key

puts "The deciphered text is:"
print deciphered_text

# create the file containing the deciphered_text
out_file_name = file_name.gsub("cipher", "out")
File.open out_file_name, "w" do
  | file |
  file.write deciphered_text
end

