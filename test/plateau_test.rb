require_relative './test_helper'

class PlateauTest < ActiveSupport::TestCase
  test 'initialzing with' do 
    plateau = MarsRover::Plateau.new(45, 76)
    assert_equal 45, plateau.x_upper_limit
    assert_equal 76, plateau.y_upper_limit
    assert_equal 0,  plateau.x_lower_limit
    assert_equal 0,  plateau.y_lower_limit
  end
end