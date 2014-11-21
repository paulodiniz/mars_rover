module MarsRover
  class Runner

    attr_accessor :plateau, :rovers

    def initialize(file_path)
      file = File.open(File.expand_path(file_path), 'r')
      output_file = File.open('ouput.txt', 'w')
      plateu_coordinates = file.readline.split(' ')
      @rovers = []
      @plateau = MarsRover::Plateau.new(plateu_coordinates[0].to_i, plateu_coordinates[1].to_i)

      while !file.eof?
        rover_position_line = file.readline.split(' ')
        rover_command_line = file.readline.strip
        rover = MarsRover::Rover.new(rover_position_line[0].to_i, 
                                         rover_position_line[1].to_i,
                                         rover_position_line[2], plateau)
        rover_command_line.each_char do |command|
          rover.run_command(command)
        end

        @rovers << rover
        output = "#{rover.x} #{rover.y} #{rover.direction}\n"
        output_file.write output
        puts output
      end
    end
  end
end