# looks at an orientation (in degree) and returns the direction
# the turtle should move in for one step.
#
# for example for the default orientation of a turtle of 0
# facing upward that direction would be Direction.new(0, -1)
# since we don't move in the x-axis just in the direction of the
# y-axis

class Direction

  attr_reader :x
  attr_reader :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  # move backwards
  def negate
    @x = -@x
    @y = -@y
    self
  end

  # get the direction for the orientation (in degree)
  # Direction gives the directions to move in with the given orientation
  def self.for orientation
    case orientation
      when 0
        Direction.new 0, -1
      when 45
        Direction.new 1, -1
      when 90
        Direction.new 1, 0
      when 135
        Direction.new 1, 1
      when 180
        Direction.new 0, 1
      when 225
        Direction.new -1, 1
      when 270
        Direction.new -1, 0
      when 315
        Direction.new -1, -1
      else
        raise "Unknown orientation, it's not a multiple of 45!"
    end
  end
  
  def to_s
    "x: " << self.x.to_s << " y: " << self.y.to_s
  end

end

