require './lib/enigma'

class CommandLineHandler

  def self.convert_message(translation_method, old_file, new_file, key, date)
    encrypt_or_decrypt = translation_method == :encryption ? :encrypt : :decrypt
    old_msg = File.open(old_file, "r").read
    new_msg = File.open(new_file, "w")
    translated_msg = Enigma.new.send(encrypt_or_decrypt, old_msg, key, date)
    new_msg.write(translated_msg[translation_method])
    new_msg.close
    print_message(new_file, translated_msg)
  end

  def self.print_message(file, message)
    p "Created #{file} with key: #{message[:key]} and date: #{message[:date]}"
  end

end


