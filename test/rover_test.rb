require_relative './test_helper'

class RoverTest < ActiveSupport::TestCase

  test 'initializing' do
    plateu = MarsRover::Plateau.new(50, 50)

    rover = MarsRover::Rover.new(27, 30, 'N', plateu)
    assert_equal 27, rover.x
    assert_equal 30, rover.y
    assert_equal 'N', rover.direction

    assert_equal plateu, rover.plateau
  end

  test 'cannot intialize a rover on a wrong position on plateau' do
    plateau = MarsRover::Plateau.new(5, 5)

    assert_raises MarsRover::RoverError do
      rover = MarsRover::Rover.new(60, 60, 'S', plateau)
    end
  end

  test 'spinnign rover to the right' do
    plateau = MarsRover::Plateau.new(50, 50)
    rover = MarsRover::Rover.new(27, 30, 'N', plateau)
    rover.turn_right
    assert_equal 'E', rover.direction
    rover.turn_right
    assert_equal 'S', rover.direction
    rover.turn_right
    assert_equal 'W', rover.direction
    rover.turn_right
    assert_equal 'N', rover.direction
  end

  test 'spinning rover to the left' do
    plateau = MarsRover::Plateau.new(50, 50)
    rover = MarsRover::Rover.new(27, 30, 'E', plateau)
    rover.turn_left
    assert_equal 'N', rover.direction
    rover.turn_left
    assert_equal 'W', rover.direction
    rover.turn_left
    assert_equal 'S', rover.direction
    rover.turn_left
    assert_equal 'E', rover.direction
  end

  test 'moving to East' do
    plateau = MarsRover::Plateau.new(50, 50)
    rover = MarsRover::Rover.new(27, 30, 'E', plateau)

    rover.move
    assert_equal 'E', rover.direction
    assert_equal 28, rover.x
    assert_equal 30, rover.y

    rover.move
    assert_equal 'E', rover.direction
    assert_equal 29, rover.x
    assert_equal 30, rover.y
  end

  test 'moving to North' do
    plateau = MarsRover::Plateau.new(50, 50)
    rover = MarsRover::Rover.new(5, 15, 'N', plateau) 
    rover.move

    assert_equal 'N', rover.direction
    assert_equal 5, rover.x
    assert_equal 16, rover.y

    rover.move

    assert_equal 'N', rover.direction
    assert_equal 5, rover.x
    assert_equal 17, rover.y
  end

  test 'moving West' do
    plateau = MarsRover::Plateau.new(50, 50)
    rover = MarsRover::Rover.new(5, 15, 'W', plateau) 
    rover.move

    assert_equal 'W', rover.direction
    assert_equal 4, rover.x
    assert_equal 15, rover.y
  end

  test 'moving South' do
    plateau = MarsRover::Plateau.new(50, 50)
    rover = MarsRover::Rover.new(5, 15, 'S', plateau) 
    rover.move

    assert_equal 'S', rover.direction
    assert_equal 5, rover.x
    assert_equal 14, rover.y
  end

  test 'spinning and moving' do
    plateau = MarsRover::Plateau.new(50, 50)
    rover = MarsRover::Rover.new(5, 15, 'S', plateau) 
    rover.turn_right
    rover.move

    assert_equal 'W', rover.direction
    assert_equal 4, rover.x
    assert_equal 15, rover.y

    rover.turn_left

    assert_equal 'S', rover.direction
    assert_equal 4, rover.x
    assert_equal 15, rover.y

    rover.move
    assert_equal 'S', rover.direction
    assert_equal 4, rover.x
    assert_equal 14, rover.y
  end

  test 'cannot go beyond the plateau' do
    plateau = MarsRover::Plateau.new(50, 50)
    rover = MarsRover::Rover.new(50, 50, 'N', plateau) 
    rover.move

    assert_equal 50, rover.x
    assert_equal 50, rover.y
    assert_equal 'N', rover.direction

    rover = MarsRover::Rover.new(50, 0, 'S', plateau) 
    rover.move
    assert_equal 50, rover.x
    assert_equal 0, rover.y
    assert_equal 'S', rover.direction


    rover = MarsRover::Rover.new(0, 30, 'W', plateau) 
    rover.move
    assert_equal 0, rover.x
    assert_equal 30, rover.y
    assert_equal 'W', rover.direction

    rover = MarsRover::Rover.new(50, 30, 'E', plateau) 
    rover.move
    assert_equal 50, rover.x
    assert_equal 30, rover.y
    assert_equal 'E', rover.direction
  end

end