require_relative './test_helper'

class RunnerTest < ActiveSupport::TestCase

  test 'initializing' do
    runner = MarsRover::Runner.new('test/data/input.txt')
    assert_equal 5, runner.plateau.x_upper_limit
    assert_equal 5, runner.plateau.y_upper_limit

    assert_equal 1, runner.rovers[0].x
    assert_equal 3, runner.rovers[0].y
    assert_equal 'N', runner.rovers[0].direction

    assert_equal 5, runner.rovers[1].x
    assert_equal 1, runner.rovers[1].y
    assert_equal 'E', runner.rovers[1].direction
  end
end