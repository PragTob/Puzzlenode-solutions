require_relative 'board'
require_relative 'position'
require_relative 'direction'

# A turtle moving on a board
# it may turn left, right or move forward or backward
class Turtle
  attr_reader :orientation
  attr_reader :position
  attr_reader :board

  FULL_CIRCLE_DEGREE = 360

  # Creates a new turtle given the board it shall walk on
  def initialize(board)
    @board = board
    @orientation = 0
    @position = @board.initial_turtle_position
  end

  def move_forward number_of_steps
    current_direction = direction
    self.move current_direction,  number_of_steps
  end


  def move_backward number_of_steps
    current_direction = direction.negate
    self.move current_direction,  number_of_steps
  end

  def turn_right degree
    @orientation += degree
    # adjustment for overly big values (while because large values aren't excluded)
    while @orientation >= FULL_CIRCLE_DEGREE
      @orientation -= FULL_CIRCLE_DEGREE
    end
  end

  def turn_left degree
    @orientation -= degree
    # adjustment for overly big values (while because large values aren't excluded)
    while @orientation < 0
      @orientation += FULL_CIRCLE_DEGREE
    end
  end

  def move(current_direction, number_of_steps)
    number_of_steps.times do
      @position.move_in current_direction
      @board.visit_field @position
    end
  end

  private

  def direction
    Direction.for @orientation
  end

end

