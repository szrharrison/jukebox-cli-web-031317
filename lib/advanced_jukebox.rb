#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

my_songs = {
  "Go Go GO" => 'C:\Users\KarinsPC\.atom\.learn-ide\home\szrharrison-47259\code\labs\jukebox-cli-web-031317\audio\Emerald-Park\01.mp3',
  "LiberTeens" => 'C:\Users\KarinsPC\.atom\.learn-ide\home\szrharrison-47259\code\labs\jukebox-cli-web-031317\audio\Emerald-Park\02.mp3',
  "Hamburg" =>  'C:\Users\KarinsPC\.atom\.learn-ide\home\szrharrison-47259\code\labs\jukebox-cli-web-031317\audio\Emerald-Park\03.mp3',
  "Guiding Light" => 'C:\Users\KarinsPC\.atom\.learn-ide\home\szrharrison-47259\code\labs\jukebox-cli-web-031317\audio\Emerald-Park\04.mp3',
  "Wolf" => 'C:\Users\KarinsPC\.atom\.learn-ide\home\szrharrison-47259\code\labs\jukebox-cli-web-031317\audio\Emerald-Park\05.mp3',
  "Blue" => 'C:\Users\KarinsPC\.atom\.learn-ide\home\szrharrison-47259\code\labs\jukebox-cli-web-031317\audio\Emerald-Park\06.mp3',
  "Graduation Failed" => 'C:\Users\KarinsPC\.atom\.learn-ide\home\szrharrison-47259\code\labs\jukebox-cli-web-031317\audio\Emerald-Park\07.mp3'
}

def help
  #this method should be the same as in jukebox.rb
  puts 'I accept the following commands:
    - help : displays this help message
    - list : displays a list of songs you can play
    - play : lets you choose a song to play
    - exit : exits this program'
end



def list( music = my_songs )
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  music.each do |song, location|
    puts song
  end
end


def play( music = my_songs )
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  song = ''
  puts 'Please enter a song name:'
  input = gets.chomp
  if music.key?( input )
    song = input
  end
  if song != ''
    puts "Playing #{song}"
    system "open #{music[song]}"
  else
    puts 'Invalid input, please try again'
  end
  song
end

def exit_jukebox
  #this method is the same as in jukebox.rb
    puts 'Goodbye'
end

def run( music = my_songs )
  #this method is the same as in jukebox.rb
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
