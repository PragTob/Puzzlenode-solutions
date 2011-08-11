require_relative 'Position'

# the board our turtle moves on
class Board

  # Constants used for the visualization of the board
  TURTLE_SYMBOL = "X"
  EMPTY_SYMBOL = "."
  SEPERATOR = " "

  attr_reader :board_size

  # creating a new board with a given size
  # size being the length of the x- and y-axis (quadratic)
  def initialize(size)
    @board_size = size
    @board = []
    @board_size.times { @board << Array.new(@board_size, EMPTY_SYMBOL) }
  end

  def center
    (@board_size / 2.0).round
  end

  def initial_turtle_position
    initial_position = Position.new center, center
    visit_field initial_position
    initial_position
  end

  def to_s
    string = ""
    @board.each do |row|
      row.each { |field| string << field << SEPERATOR }
      # the last space needs to be removed and a line break is needed
      string.chop! << "\n"
    end
    string
  end

  # marks the field corresponding to the given position as visited
  def visit_field(position)
    # check that the position is within the bounds of the board
    if ((1..board_size).include? position.y) && ((1..board_size).include? position.x)
      # adjustments for starting with 0 vs. starting with 1
      @board[position.y-1][position.x-1] = TURTLE_SYMBOL
    else
      raise "You moved your turtle out of the bounds of the board. Undefined behaviour"
    end
  end

end

