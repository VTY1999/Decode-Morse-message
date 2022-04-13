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

