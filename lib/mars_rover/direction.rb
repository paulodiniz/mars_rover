module MarsRover
  class Direction
    def self.turn_right(rover)
      case rover.direction
      when 'N'
        rover.direction = 'E'
      when 'E'
        rover.direction = 'S'
      when 'S'
        rover.direction = 'W'
      when 'W'
        rover.direction = 'N'
      end
    end

    def self.turn_left(rover)
      case rover.direction
      when 'N'
        rover.direction = 'W'
      when 'W'
        rover.direction = 'S'
      when 'S'
        rover.direction = 'E'
      when 'E'
        rover.direction = 'N'
      end
    end
  end
end