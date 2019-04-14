require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'

class ShifterTest < Minitest::Test
  attr_reader :shifter

  def setup
    @shifter = Shifter.new_shifter
  end

  def test_it_exists
    assert_instance_of Shifter, shifter
  end

  def test_it_has_attributes
    expected = [1,2,3,4]
    assert_equal expected, Shifter.new(expected).keyset
  end

  def test_it_can_generate_a_zero_padded_number_under_1000
    keys = Shifter.generate_keys_from_rand
    assert keys.all? { |key| key < 100 and key >= 0 }
  end

  def test_it_can_generate_offsets
    assert Shifter.generate_offsets.all? { |key| key < 10 and key >= 0 }
  end

  def test_it_can_generate_its_own_keyset
    assert Shifter.new_shifter.keyset.all? { |num| Integer === num }
    assert Shifter.new_shifter.keyset.all? { |num| num >= 0 }
    assert Shifter.new_shifter.keyset.length == 4
  end

end
