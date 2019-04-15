require './lib/enigma'

message, file, key, date = ARGV

old_msg = File.open(message, "r")
new_msg = File.open(file, "w")

encrypted_message = Enigma.new.encrypt(old_msg.read, key, date)
new_msg.write(encrypted_message[:encryption])
new_msg.close
p "Created #{file} with the key: #{encrypted_message[:key]} and date: #{encrypted_message[:date]}"
