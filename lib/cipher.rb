class Cipher

  def initialize
    @letters = ("a".."z").to_a << " "
  end

  def translate(letter, offset)
    letter.downcase!
    rotate_by(1) until letter_at_point.eql? letter
    rotate_by(offset)
    letter_at_point
  end

  private
  def rotate_by(offset)
    @letters.rotate!(offset)
  end

  def letters
    @letters.clone
  end

  def letter_at_point
    @letters.first
  end

end
