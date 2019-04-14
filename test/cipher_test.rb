require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/cipher'

class CipherTest < Minitest::Test
  attr_reader :cipher, :shifter

  def setup
    @cipher = Cipher.new
    @shifter = mock("shifter")
    @shifter.stubs(:next).returns(3)
    @shifter.stubs(:previous).returns(-3)
  end

  def test_it_exists
    assert_instance_of Cipher, cipher
  end

  def test_it_has_the_alphabet_plus_a_space
    assert_equal ("a".."z").to_a << " ", cipher.letters
  end

  def test_it_can_return_letter_at_point
    assert_equal "a", cipher.letter_at_point
  end

  def test_it_can_rotate_letters_using_an_offset
    assert_equal "a", cipher.letter_at_point
    cipher.rotate_by(shifter.next)
    assert_equal "d", cipher.letter_at_point

    cipher.rotate_by(shifter.previous)
    assert_equal "a", cipher.letter_at_point
  end

  def test_it_can_encode_a_letter_with_offset
    assert_equal "f", cipher.encode("c", shifter.next)
  end

end
