module MarsRover
  class Position
    def self.move(rover)
      direction = rover.direction
      rover.x += 1 if direction == 'E'
      rover.y += 1 if direction == 'N'
      rover.x -= 1 if direction == 'W'
      rover.y -= 1 if direction == 'S'
    end
  end
end