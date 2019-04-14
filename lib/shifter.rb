require './lib/cipher'

class Shifter < Cipher
  attr_reader :keyset

  def initialize(keyset)
    @keyset = keyset
  end

  def self.new_shifter
    keys = generate_keys_from_rand
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
