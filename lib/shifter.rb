require './lib/cipher'

class Shifter < Cipher
  attr_reader :keyset

  def initialize(keyset)
    @keyset = keyset
    @keys = nil
    @date = nil
    super()
  end

  def encode(letter)
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

  def self.new_shifter(numbers, date_as_num)
    @keys = numbers ; @date = date_as_num
    keys = generate_keys(numbers)
    offsets = generate_offsets(date_as_num)
    keyset= [keys, offsets].transpose.map { |arr| arr.reduce(:+) }
    Shifter.new(keyset)
  end

  def self.generate_keys(numbers)
    numbers = numbers.digits.reverse
    numbers.unshift(0) until numbers.length == 5
    numbers = numbers.each_cons(2).to_a
    numbers.map { |arr_nums| arr_nums.join.to_i }
  end

  def self.generate_offsets(date_as_num)
    large_number =  date_as_num ** 2
    large_number.digits.reverse.slice(-4, 4)
  end

end
