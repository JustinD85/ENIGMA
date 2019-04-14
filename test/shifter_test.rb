require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'

class ShifterTest < Minitest::Test
  attr_reader :shifter

  def setup
    @shifter = Shifter.new
  end

  def test_it_exists
    assert_instance_of Shifter, shifter
  end

  def test_it_can_generate_a_zero_padded_number_under_1000
    keys = shifter.generate_keys
    assert keys.all? { |key| key < 100 and key >= 0 }
  end

end
