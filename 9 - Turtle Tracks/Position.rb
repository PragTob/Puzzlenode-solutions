# the position of something in a two-dimensional room
# used for the position of the turtle on a board
class Position

  attr_reader :x
  attr_reader :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  # move in a given direction 
  def move_in(direction)
    @x += direction.x
    @y += direction.y
    self
  end

end

