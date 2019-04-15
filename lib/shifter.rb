require './lib/cipher'

class Shifter < Cipher
  attr_reader :keyset

  def initialize(keyset)
    @keyset = keyset
    super()
  end


  def encode(letter)
    return letter unless @letters.include? letter
    translate(letter, next_key!)
  end

  def decode(letter)
    translate(letter, inverse_next_key!)
  end

  private

  def next_key!
    key =  @keyset.first
    @keyset.rotate!
    key
  end

  def inverse_next_key!
    key =  @keyset.first * -1
    @keyset.rotate!
    key
  end

  def self.new_shifter(keys = generate_keys_from_rand)
    offsets = generate_offsets
    keyset= [keys, offsets].transpose.map { |arr| arr.reduce(:+) }
    Shifter.new(keyset)
  end

  def self.generate_keys_from_rand
    numbers = rand(100000).digits
    numbers.unshift(0) until numbers.length == 5
    numbers = numbers.each_cons(2).to_a
    numbers.map { |arr_nums| arr_nums.join.to_i }
  end

  def self.generate_offsets
    large_number = Time.now.strftime("%d%m%y").to_i ** 2
    large_number.digits.slice(-4, 4)
  end


end
