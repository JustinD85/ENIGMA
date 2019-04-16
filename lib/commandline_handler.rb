require './lib/enigma'

class CommandLineHandler

  def self.convert_message(translation_method, message, file, key, date)
    encrypt_or_decrypt = translation_method == :encryption ? :encrypt : :decrypt
    old_msg = File.open(message, "r")
    new_msg = File.open(file, "w")
    translated_msg = Enigma.new.send(encrypt_or_decrypt, old_msg.read, key, date)
    new_msg.write(translated_msg[translation_method])
    new_msg.close
    p "Created #{file} with the key: #{translated_msg[:key]} and date: #{translated_msg[:date]}"
  end

end


