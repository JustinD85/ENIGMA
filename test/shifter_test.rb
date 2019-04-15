require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'

class ShifterTest < Minitest::Test
  attr_reader :shifter

  def setup
    @shifter = Shifter.new_shifter(2715, 40895)
  end

  def test_it_exists
    assert_instance_of Shifter, shifter
  end

  def test_it_has_attributes
    expected = [1,2,3,4]
    assert_equal expected, Shifter.new(expected).keyset
  end

  def test_it_can_generate_a_zero_padded_number_under_1000
    keys = Shifter.generate_keys(2715)
    assert keys.all? { |key| key < 100 and key >= 0 }
  end

  def test_it_can_generate_offsets
    date_as_num = Shifter.format_today
    assert Shifter.generate_offsets(date_as_num).all? { |key| key < 10 and key >= 0 }
  end

  def test_it_can_generate_its_own_keyset
    assert Shifter.new_shifter.keyset.all? { |num| Integer === num }
    assert Shifter.new_shifter.keyset.all? { |num| num >= 0 }
    assert Shifter.new_shifter.keyset.length == 4
  end

  def test_it_can_rotate_keys_in_keyset
    shifter = Shifter.new_shifter
    assert shifter.send(:next_key!) != shifter.send(:next_key!)
  end

  def test_it_can_return_key_in_keyset
    assert_instance_of Integer, Shifter.new_shifter.send(:next_key!)
    assert_instance_of Integer, Shifter.new_shifter.send(:inverse_next_key!)
    assert Shifter.new_shifter.send(:inverse_next_key!) <= 0
  end

  def test_it_can_encode_a_letter_with_offset
    shifter = Shifter.new_shifter(2715, 40895)
    assert_equal "k", shifter.encode("h")
    assert_equal "e", shifter.encode("e")
    assert_equal "d", shifter.encode("l")
    assert_equal "x", shifter.encode("d")
  end

  def test_it_can_decode_a_letter_with_offset
    shifter = Shifter.new_shifter(2715, 40895)
    assert_equal "h", shifter.decode("k")
    assert_equal "e", shifter.decode("e")
    assert_equal "l", shifter.decode("d")
    assert_equal "d", shifter.decode("x")
  end

  

end
