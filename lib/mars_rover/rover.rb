require_relative './direction'
require_relative './position'

module MarsRover

  class RoverError < StandardError; end

	class Rover

    attr_accessor :x, :y, :direction, :plateau

    def initialize(x, y, direction, plateau)
      self.x = x
      self.y = y
      self.direction = direction
      self.plateau = plateau

      raise RoverError unless valid_position?
    end

    def turn_right
      MarsRover::Direction.turn_right(self)
    end

    def turn_left
      MarsRover::Direction.turn_left(self)
    end

    def move
      MarsRover::Position.move(self)
    end

    private
    def valid_position?
      x < plateau.x_upper_limit &&
      x > plateau.x_lower_limit &&
      y < plateau.y_upper_limit &&
      y > plateau.y_lower_limit
    end
  end

end