songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
    puts 'I accept the following commands:
      - help : displays this help message
      - list : displays a list of songs you can play
      - play : lets you choose a song to play
      - exit : exits this program'
end

def list( music = songs )
  music.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end
end

def play( music = songs )
  song = ''
  puts 'Please enter a song name or number:'
  input = gets.chomp
  if input[/\A\d+\Z/]
    input = Integer(input)
    input -= 1
    song = music[input]
  elsif music.include?( input )
    song = input
  end
  if song != '' && song != nil
    puts "Playing #{song}"
  else
    puts 'Invalid input, please try again'
  end
  song
end

def exit_jukebox
  puts 'Goodbye'
end

def run( music = songs )
  help
  input = ''
  until input == 'exit'
    puts 'Please enter a command:'
    input = gets.chomp
    case input
    when 'help'
      help
    when 'list'
      list( music )
    when 'play'
      play( music )
    when 'exit'
      exit_jukebox
    else
      puts 'Invalid input, please try again'
    end
  end
end
