require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  attr_reader :enigma

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, enigma
  end

  def test_it_has_attributes
    refute enigma.key
    refute enigma.date_as_num
  end

  def test_it_can_encrypt_a_message
    expected = {
           encryption: "keder ohulw",
           key: "02715",
           date: "040895"
         }

    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

end
