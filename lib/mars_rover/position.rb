module MarsRover
  class Position

    def self.move(rover)
      return unless can_move?(rover)
      direction = rover.direction
      rover.x += 1 if direction == 'E'
      rover.y += 1 if direction == 'N'
      rover.x -= 1 if direction == 'W'
      rover.y -= 1 if direction == 'S'
    end

    def self.can_move?(rover)
      plateau = rover.plateau
      direction = rover.direction

      case direction
      when 'N'
        rover.y < plateau.y_upper_limit
      when 'S'
        rover.y > plateau.y_lower_limit
      when 'W'
        rover.x > plateau.x_lower_limit
      when 'E'
        rover.x < plateau.x_upper_limit
      end

    end
  end
end