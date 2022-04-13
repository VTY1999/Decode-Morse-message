require_relative 'colors'

def decode_char(character)
  codes = { '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F',
            '--.' => 'G', '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L',
            '--' => 'M', '-.' => 'N', '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R',
            '...' => 'S', '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W', '-..-' => 'X',
            '-.--' => 'Y', '--..' => 'Z', ' ' => ' ', '.----' => '1', '..---' => '2', '...--' => '3',
            '....-' => '4', '.....' => '5', '-....' => '6', '--...' => '7', '---..' => '8', '----.' => '9',
            '-----' => '0' }

  if codes.key?(character)
    codes[character]
  else
    ''
  end
end

def decode_word(word)
  letters = word.split(/ /)
  decoded_word = ''

  letters.each do |letter|
    decoded_word += decode_char(letter)
  end

  decoded_word
end

def decode(sentence)
  words = sentence.strip.tr('/', ' ').split(/   /)
  message = []
  words.each do |word|
    message.push(decode_word(word))
  end

  message.join(' ')
end

def run_decoder()
  puts 'Enter Morse Code to decode:'
  input = gets.chomp

  print "\n\n                     ...Decoding...".send(:red).send(:bold)
  sleep 1
  Gem.win_platform? ? (system 'cls') : (system 'clear')

  puts "\n\n\n\n\nYour decoded message is: #{decode(input).send(:green)}"
  sleep 5
end

run_decoder
