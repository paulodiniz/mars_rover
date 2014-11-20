module MarsRover
  class Plateau

    attr_accessor :x_upper_limit, :y_upper_limit, :x_lower_limit, :y_lower_limit

    def initialize(x_upper_limit, y_upper_limit)
      self.x_upper_limit = x_upper_limit
      self.y_upper_limit = y_upper_limit
      self.x_lower_limit = 0
      self.y_lower_limit = 0
    end

  end
end