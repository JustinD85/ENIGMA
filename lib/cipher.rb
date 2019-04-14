class Cipher
  attr_reader :letters

  def initialize
    @letters = ("a".."z").to_a << " "
  end

  def rotate_by(offset)
    @letters.rotate!(offset)
  end

end
