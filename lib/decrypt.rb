require './lib/enigma'

message, file, key, date = ARGV

old_msg = File.open(message, "r")
new_msg = File.open(file, "w")

decrypted_message = Enigma.new.decrypt(old_msg.read, key, date)
new_msg.write(decrypted_message[:decryption])
new_msg.close
p "Created #{file} with the key: #{decrypted_message[:key]} and date: #{decrypted_message[:date]}"
