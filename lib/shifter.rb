class Shifter


  def generate_keys
    numbers = rand(100000).digits
    numbers.unshift(0) until numbers.length == 5
    numbers = numbers.each_cons(2).to_a
    numbers.map { |arr_nums| arr_nums.join.to_i }
  end

end
