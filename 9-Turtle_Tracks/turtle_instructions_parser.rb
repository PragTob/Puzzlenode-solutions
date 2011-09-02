require_relative 'board'
require_relative 'turtle'

# Parses the instructions for a turtle given by an input file
# valid commands are:
# RT degree - right turn
# LT degree - left turn
# FD steps  - forward
# BK steps  - backward
# REPEAT n  - repeat follwoing instructions n-times
class TurtleInstructionsParser

  # parsing the instructions file, thereby creating the appropiate output file
  def self.parse(instructions_file)
    file = File.open instructions_file

    # parse the boardsize (first value)
    board_size = file.readline.chomp.to_i
    initialize_components board_size
    puts "Board and turtle initialized"

    # uninteresting newline (such is the file format)
    file.readline

    # real parsing action
    file.each do |line|
      if line.match /REPEAT \d+/
        parse_repeat_command line
      else
        parse_movement_command line
      end
    end
    file.close

    puts "The result of the turtle movements:"
    print @board.to_s

    # create the output file
    out_file_name = instructions_file.gsub ".logo", "_out.txt"
    File.open out_file_name, "w" do |file|
      file.write @board.to_s
    end
  end

  private

  def self.initialize_components(board_size)
    @board = Board.new board_size
    @turtle = Turtle.new @board
  end

  # parsing the movement commands (RT, LT, MV, BK)
  def self.parse_movement_command string
    case string
      when /RT (\d+)/
        @turtle.turn_right $1.to_i
      when /LT (\d+)/
        @turtle.turn_left $1.to_i
      when /FD (\d+)/
        @turtle.move_forward $1.to_i
      when /BK (\d+)/
        @turtle.move_backward $1.to_i
      else
        raise 'unknown parse command "' << string << '"'
    end
  end

  # responsible for handling the repeat command
  def self.parse_repeat_command string
    repeat_count = string.match(/REPEAT (\d+)/)[1].to_i

    # extract the REPEAT part with the commands
    command_string = string[string.index('[') + 1 ... string.index(']') - 1]


    # unfortunately my tries with split(/([A-Z]+ \d+) /) failed
    # the array contained many empty strings (because it matched and all that
    # left was an empty string I guess)
    # so I decided to insert my own seperations marks and then split
    command_string.gsub!(/[A-Z]+ \d+ /) { | match | match.chop << "|"}
    commands = command_string.split "|"

    # and now repeat all the contained commands
    repeat_count.times do
      commands.each do |command|
        # there are no nested REPEATS
        parse_movement_command command
      end
    end
  end

end

