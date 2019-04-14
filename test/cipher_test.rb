require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher'

class CipherTest < Minitest::Test
  attr_reader :cipher

  def setup
    @cipher = Cipher.new
  end

  def test_it_exists
    assert_instance_of Cipher, cipher
  end

  def test_it_has_the_alphabet_plus_a_space
    assert_equal ("a".."z").to_a << " ", cipher.letters
  end

  def test_it_can_rotate_letters_using_an_offset
    assert_equal "a", cipher.letters.first

    cipher.rotate_by(3)
    assert_equal "d", cipher.letters.first

    cipher.rotate_by(-3)
    assert_equal "a", cipher.letters.first
  end

end
