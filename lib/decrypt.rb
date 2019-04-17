require './lib/commandline_handler'

message, file, key, date = ARGV
CommandLineHandler.convert_message(:decryption, message, file, key, date)
