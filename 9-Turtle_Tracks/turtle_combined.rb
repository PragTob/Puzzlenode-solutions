require_relative 'turtle_instructions_parser'

# a simple script that ultimately solves the turtle puzzle using the
# TurtleInstructionsParser

filename = "complex.logo" unless filename = ARGV.first

TurtleInstructionsParser.parse filename

