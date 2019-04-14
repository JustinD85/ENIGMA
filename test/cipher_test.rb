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

end
