require './lib/shifter'
require './lib/util'

class Enigma
  include Util
  attr_reader :key, :date_as_num

  def initialize
    @key = nil
    @date_as_num = nil
  end

  def encrypt(message, key = rand(100000), date = format_today)
    {
      encryption: translate_a_message(message,key,date),
      key: key,
      date: date
    }
  end

  private

  def translate_a_message(message, key, date, decode = false)
    translate = decode ? :decode : :encode
    shifter = Shifter.new_shifter(key.to_i, date.to_i)
    message.chars.map { |char| shifter.send(translate,char) }.join
  end


end
