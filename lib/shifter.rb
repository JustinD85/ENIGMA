require './lib/cipher'

class Shifter < Cipher
  attr_reader :keyset

  def initialize(keyset)
    @keyset = keyset
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

  def self.new_shifter(numbers = rand(100000), date_as_num = format_today)
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

  def self.format_today
    Time.now.strftime("%d%m%y").to_i
  end

end
