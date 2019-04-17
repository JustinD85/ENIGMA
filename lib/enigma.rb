require './lib/shifter'
require './lib/util'

class Enigma
  include Util
  attr_reader :key, :date_as_num

  def encrypt(message, key, date)
    message.downcase!
    key ||= rand(100000)
    date ||= format_today
    {
      encryption: translate_a_message(message, key, date),
      key: key.to_s,
      date: date.to_s
    }
  end

  def decrypt(message, key, date = format_today)
    date ||= format_today
    {
      decryption: translate_a_message(message, key, date, true),
      key: key.to_s,
      date: date.to_s
    }
  end

  private
  def translate_a_message(message, key, date, decode = false)
    translate = decode ? :decode : :encode
    shifter = Shifter.new_shifter(key.to_i, date.to_i)
    message.chars.map { |char| shifter.send(translate, char) }.join
  end

end
